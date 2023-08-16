import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

class OtpNode extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onChanged;
  final VoidCallback onTapClick;
  final int index;

  const OtpNode({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onTapClick,
    required this.focusNode,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: onTapClick,
        enableInteractiveSelection: false,
        controller: controller,
        key: const Key('otpNode'),
        focusNode: focusNode,
        cursorColor: context.colorScheme.primary,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        style: context.headlineMedium,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          hintText: '',
          hintStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(
              8.sp,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(
              8.sp,
            ),
          ),
        ),
      ).paddingOnOnlySides(
        right: 8.sp,
        left: 8.sp,
      ),
    );
  }
}
