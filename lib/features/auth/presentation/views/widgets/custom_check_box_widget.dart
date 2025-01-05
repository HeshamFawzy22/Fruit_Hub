// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  const CustomCheckBoxWidget({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool isChecked = false;

  // final ValueChanged<bool> onChanged;
  @override
  /// A custom checkbox widget which uses an SVG picture as its icon
  /// and has a nice animation when changing its state.
  ///
  /// The [widget.isChecked] parameter determines the state of the checkbox
  /// and the [widget.onChanged] callback is called when the state changes.

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChanged(isChecked);
        });
      },
      child: AnimatedContainer(
        width: 24.0,
        height: 24.0,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(Assets.imagesCheckIcon),
              )
            : const SizedBox(),
      ),
    );
  }
}
