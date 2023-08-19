import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';

enum WeekDays { sun, mon, tue, wed, thu, fri, sat }

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class DayHeaders extends StatelessWidget {
  const DayHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.sp, top: 4.sp),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 1,
        color: context.dividerColor,
      ))),
      child: Row(
        children: [
          ...WeekDays.values
              .map(
                (e) => Expanded(
                  child: Text(
                    e.name.capitalize(),
                    maxLines: 1,
                    style: context.bodySmall?.copyWith(fontSize: 14.sp),
                  ).paddingOnOnlySides(left: 16.sp),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
