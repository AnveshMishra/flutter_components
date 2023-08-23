import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

class UploadFlotingOrders extends StatelessWidget {
  const UploadFlotingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20.sp,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.sp),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.sp),
              side: BorderSide(
                width: 0.5.sp,
                color: context.borderColor,
              ),
            ),
          ),
          child: Row(
            children: [
              MaterialButton(
                elevation: 0.5,
                onPressed: () => {},
                color: context.borderColor,
                child: Text(
                  'Choose Files',
                  style: context.headlineSmall,
                ),
              ),
              SizedBox(
                width: 16.sp,
              ),
              Text(
                "No File Choosen",
                style: context.headlineSmall
                    ?.copyWith(color: context.colorScheme.secondary),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.sp,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.onBackground,
              ),
              onPressed: () {},
              child: Text(
                'Upload',
                style: context.headlineSmall
                    ?.copyWith(color: context.colorScheme.background),
              ).paddingSymmetric(vertical: 14.sp),
            ),
            SizedBox(
              width: 8.sp,
            ),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  // backgroundColor: context.colorScheme.onBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.sp),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.file_present_outlined),
                    SizedBox(
                      width: 8.sp,
                    ),
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          'Download Sample Excel',
                          style: context.headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 12.sp),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.sp, vertical: 8.sp),
      ],
    );
  }
}
