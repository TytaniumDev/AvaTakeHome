import 'package:flutter/material.dart';

const maxContentWidth = 750.0;
const gridMaxCrossAxisExtent = 724.0;

/// Ensures that content is never more than [maxContentWidth] wide.
///
/// Meant to be used at the route/page top level.
class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  const ResponsiveContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: maxContentWidth),
        child: child,
      ),
    );
  }
}
