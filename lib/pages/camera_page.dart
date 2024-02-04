import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? _image;
  String _responseBody = "";
  bool _isSending = false;
  String customPrompt = "";

  _openCamera() {
    if (_image == null) {
      _getImageFromCamera();
    }
  }

  Future<void> _getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      ImageCropper cropper = ImageCropper();
      final croppedImage = await cropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          iosUiSettings: const IOSUiSettings(
            title: "Cropper",
          ));

      setState(() {
        _image = croppedImage != null ? XFile(croppedImage.path) : null;
      });
    }
  }

  Future<void> sendImage(XFile? imagefile) async {
    if (imagefile == null) return;
    setState(() {
      _isSending = true;
    });
    String base64Image = base64Encode(File(imagefile.path).readAsBytesSync());
    String apiKey = "AIzaSyCFWOYBH2LATmCEkwLAFbnzRJnm5AtS6Ko";
    String requestBody = json.encode({
      "contents": [
        {
          "parts": [
            {
              "text":
                  "Which type of fish? First give me the fish name and Tell me about this fish species by using bullet points. In what seasons should I not catch this fish species? If image is not a fish image tell the user. "
            },
            {
              "inlineData": {"mimeType": "image/jpeg", "data": base64Image}
            },
          ]
        }
      ],
      "generationConfig": {
        "temperature": 0.4,
        "topK": 32,
        "topP": 1,
        "maxOutputTokens": 4096,
        "stopSequences": []
      },
      "safetySettings": [
        {
          "category": "HARM_CATEGORY_HARASSMENT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_HATE_SPEECH",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        },
        {
          "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
          "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        }
      ]
    });
    http.Response response = await http.post(
        Uri.parse(
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: requestBody);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      setState(() {
        _responseBody =
            jsonBody["candidates"][0]["content"]["parts"][0]["text"];
        _isSending = false;
      });
      print(response.body);
    } else {
      setState(() {
        _isSending = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60),
                _image == null
                    ? const Center(
                        child: Text(
                          "No Image Selected",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Image.file(File(_image!.path)),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 120),
                  child: Text(
                    _responseBody,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          if (_isSending)
            Center(
              child: Lottie.asset(
                "assets/png/Fish_loading.json",
                animate: true,
                height: 150,
                width: 150,
              ),
            )
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.centerRight,
        child: FloatingActionButton(
          onPressed: () {
            _image == null ? _openCamera() : sendImage(_image);
          },
          tooltip: _image == null ? "No Image Selected" : "Send image",
          child: Icon(_image == null ? Icons.camera_alt : Icons.send),
        ),
      ),
    );
  }
}
