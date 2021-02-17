import 'package:flutter/material.dart';
import 'package:responsive_layout/src/enums.dart';
import 'package:responsive_layout/src/responsive_builder.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget watchLayout;
  final Widget smallPhoneLayout;
  final Widget phoneLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    Key key,
    this.watchLayout,
    this.smallPhoneLayout,
    @required this.phoneLayout,
    this.tabletLayout,
    this.desktopLayout,
  }) : super(key: key);

  Widget errorContainer(String screenType) {
    return Container(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$screenType == null.\n"
            "layout should not be equal to null.\n"
            "Provide correct layout",
            style: TextStyle(color: Colors.orangeAccent),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizing) {
        switch (sizing.screenType) {
          case ScreenType.XS:
            return watchLayout ?? errorContainer("WatchLayout");
          case ScreenType.S:
            return smallPhoneLayout ?? errorContainer("SmallPhoneLayout");
          case ScreenType.XL:
            return tabletLayout ?? errorContainer("TabletLayout");
          case ScreenType.XXL:
            return desktopLayout ?? errorContainer("DesktopLayout");
          default:
            return phoneLayout ?? errorContainer("PhoneLayout");
        }
      },
    );
  }
}
