
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final Widget child;
  final Widget? bottomWidget;
  final EdgeInsetsGeometry? padding;

  const CustomPage({
    Key? key,
    required this.child,
    this.bottomWidget,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.minWidth,
            ),
            child: IntrinsicHeight(
              child: bottomWidget == null
                  ? child
                  : Column(
                      children: [
                        Expanded(child: child),
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
