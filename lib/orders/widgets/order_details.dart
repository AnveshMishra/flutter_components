import 'package:api_client/app_text_field.dart';
import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:flutter/material.dart';

class MyOrderForms extends StatelessWidget {
  final ScrollController? scrollController;
  final List<FormFields> formFields;
  const MyOrderForms(
      {super.key, this.scrollController, required this.formFields});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: formFields.length,
      itemBuilder: (context, index) {
        return AppTextField(
          readOnly: formFields[index].readOnly,
          label: formFields[index].label,
          initValue: formFields[index].initValue,
          controller: formFields[index].controller,
          bgColor: formFields[index].bgColor,
        ).paddingOnOnlySides(
          top: index == 0 ? 16.sp : 0,
          left: 16.sp,
          right: 16.sp,
          bottom: 16.sp,
        );
      },
    );
  }
}

class FormFields {
  final bool? readOnly;
  final String label;
  final Color? bgColor;
  final String? initValue;
  final TextEditingController controller;

  FormFields({
    this.readOnly,
    required this.label,
    this.bgColor,
    this.initValue,
    required this.controller,
  });
}
