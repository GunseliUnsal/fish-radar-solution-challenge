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
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(20.0), //Remove const
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
    ));
  }
}
