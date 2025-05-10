import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double progress;

  AnimatedProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 20.0,
          decoration: BoxDecoration(
            color: AppConstants.backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        AnimatedContainer(
          duration: AppConstants.mediumAnimationDuration,
          width: progress * MediaQuery.of(context).size.width,
          height: 20.0,
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: AppConstants.bodyText.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
