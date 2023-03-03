import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  final Widget child;
  final Widget? bottomWidget;
  final EdgeInsetsGeometry? padding;
  final bool hasAppBar;
  final int topFlex;

  const BodyLayout({
    Key? key,
    required this.child,
    this.bottomWidget,
    this.padding = const EdgeInsets.all(16),
    this.hasAppBar = true,
    this.topFlex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  constraints.maxHeight - (hasAppBar ? kTextTabBarHeight : 0),
              minWidth: constraints.minWidth,
            ),
            child: IntrinsicHeight(
              child: bottomWidget == null
                  ? child
                  : Column(
                      children: [
                        Expanded(
                          flex: topFlex,
                          child: child,
                        ),
                        bottomWidget!,
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
