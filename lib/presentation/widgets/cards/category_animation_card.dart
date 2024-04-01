import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class CategoryAnimation extends StatefulWidget {
  final Category? category;

  const CategoryAnimation({Key? key, this.category}) : super(key: key);

  @override
  _CategoryAnimationState createState() => _CategoryAnimationState();
}

class _CategoryAnimationState extends State<CategoryAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shapeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _shapeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 200.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: Color(widget.category?.color ?? Colors.white.value),
            borderRadius: BorderRadius.circular(
              _shapeAnimation.value * 30.r,
            ),
          ),
          child: Center(
            child: Text(
              widget.category?.title ?? "",
              style: AppTextStyles.bold12,
            ),
          ),
        );
      },
    );
  }
}
