import 'package:fish_radar/constants/colors.dart';
import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({
    super.key,
    required this.titleText,
    required this.subtitleText,
    required this.leadingIcon,
    required this.onTap,
  });

  final String titleText;
  final String subtitleText;
  final Icon leadingIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 360,
        height: 100,
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
                    leading: leadingIcon,
                    iconColor: whiteColor,
                    title: Text(titleText,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      subtitleText,
                      style: TextStyle(color: whiteColor, fontSize: 12),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
