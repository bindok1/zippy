import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class LikeButton extends StatefulWidget {
  final bool initialLiked;
  final Color iconColor;
  final bool showBorder;

  const LikeButton({
    Key? key,
    this.initialLiked = false,
    this.iconColor = Colors.white,
    this.showBorder = true,
  }) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late bool isLiked;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    isLiked = widget.initialLiked;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 1,
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
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: widget.showBorder
                ? Border.all(
                    color: widget.iconColor.withOpacity(0.4),
                    width: 1,
                  )
                : null,
          ),
          child: Center(
            child: Icon(
              isLiked ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart,
              color: widget.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
