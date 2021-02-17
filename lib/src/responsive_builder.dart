import 'package:flutter/material.dart';
import 'package:responsive_layout/src/sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation information)
      builder;

  const ResponsiveBuilder({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);

        final screenSize = mediaQuery.size;
        final orientation = mediaQuery.orientation;
        final localWidgetSize = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );

        final sizing = SizingInformation(
          screenSize: screenSize,
          localWidgetSize: localWidgetSize,
          screenOrientation: orientation,
        );

        return builder(context, sizing);
      },
    );
  }
}
