import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:fish_radar/pages/camera_page.dart';
import 'package:fish_radar/pages/fish_page.dart';
import 'package:fish_radar/pages/home_page.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomBarPages = [
      HomePage(
          fishTitle: 'Blueface Angelfish',
          pageController: pageController,
          notchBottomBarController: _controller,
          fishDescription:
              "Pomacanthus xanthometopon grows to a maximum length of 38 centimetres (15 in) and is laterally compressed. The mouth is just..."),
      const CameraPage(),
      const FishPage(),
    ];

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: const Color(0xFF385D9E),
              showLabel: false,
              shadowElevation: 3,
              kBottomRadius: 30.0,
              notchColor: const Color(0xFF385D9E),

              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 200,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.white70,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white70,
                  ),
                  activeItem: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Camera',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.search_outlined,
                    color: Colors.white70,
                  ),
                  activeItem: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'Fish Species',
                ),
              ],
              onTap: (index) {
                pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
