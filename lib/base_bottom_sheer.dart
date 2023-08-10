import 'package:flutter/material.dart';
import 'package:flutter_application_5/sizer/sizer/size_config.dart';

Future<void> showAppBottomSheet({
  required BuildContext context,
  required Widget child,
  String? text,
}) {
  return showModalBottomSheet(
      context: context,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            24.sp,
          ),
          topRight: Radius.circular(24.sp),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: 0,
            // MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20.sp),
              constraints: BoxConstraints(maxHeight: 0.7.screenHeightMultiple),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 8.sp,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 4.sp,
                      width: 48.sp,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                    ),
                  ),
                  Flexible(child: child),
                ],
              ),
            ),
          ),
        );
      });
}
