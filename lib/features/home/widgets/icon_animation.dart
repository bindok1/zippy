import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class IconAnimationWidget extends StatefulWidget {
  final bool initial;
  final Color iconColor;
  final double iconSize;
  final IconData iconOutline;
  final IconData iconBold;

  const IconAnimationWidget({
    Key? key,
    this.initial = false,
    this.iconColor = Colors.white,
    this.iconOutline = IconsaxPlusBroken.home,
    this.iconBold = IconsaxPlusBold.home,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  _IconAnimationWidgetState createState() => _IconAnimationWidgetState();
}

class _IconAnimationWidgetState extends State<IconAnimationWidget>
    with SingleTickerProviderStateMixin {
  late bool isLiked;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    isLiked = widget.initial;
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    HapticFeedback.lightImpact();
    setState(() {
      isLiked = !isLiked;
    });
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: ScaleTransition(
        scale: _controller,
        child: Icon(
          isLiked ? widget.iconBold : widget.iconOutline,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
      ),
    );
  }
}
