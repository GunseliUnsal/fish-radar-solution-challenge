import 'dart:io';

import 'package:fish_radar/api/utils/constants.dart';
import 'package:fish_radar/constants/colors.dart';
import 'package:fish_radar/demos/camera_state.dart';
import 'package:fish_radar/demos/text_shimmer.dart';
import 'package:fish_radar/pages/fish_detail_page.dart';
import 'package:google_gemini/google_gemini.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart'
    as picker; // Using 'as' for alias
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// ignore: must_be_immutable
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
  /*final String _geminiQuery =
      "Which type of fish? First give me the fish name and Tell me about this fish species by using bullet points. In what seasons should I not catch this fish species? If image is not a fish image tell the user. JUST return all answer html body format. ";
*/
  final String _geminiQuery =
      "Provide detailed and organized information about the fish in the photo. If there is no fish in the photo, return an answer stating this, return all answers in html body format ONLY";

  final gemini = GoogleGemini(apiKey: Constants.GEMINI_API_KEY);

  _openCamera() {
    if (_image == null) {
      _getImageFromCamera();
    }
  }

  Future<void> _getImageFromCamera() async {
    final XFile? image =
        await picker.ImagePicker().pickImage(source: picker.ImageSource.camera);

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
      );

      setState(() {
        _image = croppedImage != null ? XFile(croppedImage.path) : null;
        sendImage(_image);
      });
    }
  }

  Future<void> sendImage(XFile? imagefile) async {
    if (imagefile == null) return;

    setState(() {
      _isSending = true;
    });

    gemini
        .generateFromTextAndImages(
            query: _geminiQuery, image: File(imagefile.path))
        .then((value) {
      setState(() {
        _responseBody = value.text;
        print(_responseBody);
        _isSending = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _openCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Opacity(
                  opacity: 0.5, // Set the opacity value as needed
                  child: Image.asset(
                    "assets/png/image_not_selected.png",
                    height: 70,
                  ),
                ),
                const SizedBox(height: 16), // Adjust the spacing as needed
                const Text(
                  "No Image Selected",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(bottomNavbarColor),
                    ),
                    onPressed: () {
                      _openCamera();
                    },
                    child: const Text(
                      "Open Camera",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Image.file(File(_image!.path))),
              const SizedBox(height: 20),
              if (!_isSending)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 130),
                  child: Visibility(
                    visible: !_isSending,
                    child: Column(
                      children: [
                        HtmlWidget(
                          _responseBody,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const FeedBack()
                      ],
                    ),
                  ),
                )
              else
                const ShimmerColumnWidget(count: 20),
            ],
          ),
        ),
      );
    }
  }
}
