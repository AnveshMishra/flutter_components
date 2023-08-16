import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

class RecentOrderTableWidget extends StatelessWidget {
  const RecentOrderTableWidget({super.key, required this.elements});

  final List<RecentOrderTableElements> elements;

  @override
  Widget build(BuildContext context) {
    TextStyle? headerTextStyle = context.bodySmall?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: context.colorScheme.secondary,
    );
    return Table(
      border: TableBorder.all(
        color: context.borderColor,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      columnWidths: const {
        0: FractionColumnWidth(0.25),
        1: FractionColumnWidth(0.5),
        2: FractionColumnWidth(0.25),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: context.borderColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.sp),
              topRight: Radius.circular(8.sp),
            ),
          ),
          children: [
            Center(
                child: Text(
              'Po No.',
              style: headerTextStyle,
            ).paddingFromAllSide(8.sp)),
            Center(
              child: Text(
                'Product name',
                style: headerTextStyle,
              ).paddingFromAllSide(8.sp),
            ),
            Center(
              child: Text(
                'Action',
                style: headerTextStyle,
              ).paddingFromAllSide(8.sp),
            ),
          ],
        ),
        for (var item in elements) ...[
          TableRow(
            children: [
              Center(
                child: Text(
                  item.poNo,
                  style: headerTextStyle,
                ).paddingSymmetric(horizontal: 8.sp, vertical: 8.sp),
              ),
              Center(
                child: Text(
                  item.productName,
                  style: context.bodySmall?.copyWith(fontSize: 13.sp),
                ).paddingSymmetric(horizontal: 8.sp, vertical: 8.sp),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                ),
                onPressed: item.onTap,
                child: const Text('Order'),
              ).paddingSymmetric(horizontal: 8.sp),
            ],
          ),
        ]
      ],
    ).paddingFromAllSide(16.sp);
  }
}

class RecentOrderTableElements {
  final String poNo;
  final String productName;
  final VoidCallback onTap;

  RecentOrderTableElements({
    required this.poNo,
    required this.productName,
    required this.onTap,
  });
}
