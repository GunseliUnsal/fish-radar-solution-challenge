import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';

class ModulePageCard extends StatelessWidget {
  const ModulePageCard({
    super.key,
    required this.titleText,
    required this.subtitleText,
    required this.rowIcon,
    required this.onTap,
  });

  final String titleText;
  final String subtitleText;
  final ImageIcon rowIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rowIcon,
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 8, left: 16, right: 16),
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 8, left: 16, right: 16),
              child: Text(
                subtitleText,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: whiteColor.withOpacity(0.7), fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 8, left: 16, right: 16),
              child: ElevatedButton(
                  onPressed: onTap,
                  child: Text(
                    "Read More",
                    style: TextStyle(color: bottomNavbarColor),
                  )),
            )
          ],
        ),
      ),
    );

    /*Center(
        child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.46, // Adjust as needed
        height: MediaQuery.of(context).size.width * 0.36, // Adjust as needed
        child: Card(
          color: bottomNavbarColor,
          child: InkWell(
            splashColor: backgroundColor.withAlpha(50),
            onTap: onTap,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    iconColor: whiteColor,
                    title: Text(
                      titleText,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      subtitleText,
                      style: TextStyle(color: whiteColor, fontSize: 10),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(16.0), //Remove const
                              child: rowIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));*/
  }
}
