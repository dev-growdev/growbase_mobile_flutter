import 'package:flutter/material.dart';

class BottomSheetLayout extends StatelessWidget {
  final Widget child;
  final List<Widget> actions;
  const BottomSheetLayout({
    Key? key,
    required this.child,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(height: 56),
        Expanded(
          child: Material(
            elevation: 1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28),
              ),
            ),
            color: theme.colorScheme.surface,
            shadowColor: theme.colorScheme.shadow,
            surfaceTintColor: theme.colorScheme.surfaceTint,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                        const Spacer(),
                        ...actions,
                      ],
                    ),
                  ),
                  Expanded(child: child)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
