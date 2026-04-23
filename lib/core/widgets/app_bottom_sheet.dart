import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool showDragHandle;

  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.showDragHandle = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showDragHandle)
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
