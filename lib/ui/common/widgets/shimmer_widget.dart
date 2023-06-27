import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

///
/// This class provides shimmer widget when data is being fetched from server
///
class ShimmerWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double width;
  final double height;
  final double borderRadius;
  final Widget child;

  const ShimmerWidget(
      {Key? key,
      this.padding,
      this.margin,
      this.width = 150,
      this.height = 180,
      this.borderRadius = 10,
      this.child = const Offstage()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ShimmerWrapper(Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: theme.colorScheme.onTertiaryContainer,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: child));
  }
}

class ShimmerWrapper extends StatelessWidget {
  final Widget child;

  const ShimmerWrapper(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.outline,
      highlightColor: theme.colorScheme.onTertiaryContainer,
      child: child,
    );
  }
}
