import 'package:api_client/padding_ext.dart';
import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SettingList extends StatefulWidget {
  final List<String> masterList;
  final List<String> selectedList;
  final Function(String) onTap;
  const SettingList(
      {super.key,
      required this.masterList,
      required this.selectedList,
      required this.onTap});

  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  final List<String> _selectedList = [];
  List<String> _searchList = [];

  @override
  void initState() {
    super.initState();
    _selectedList.addAll(widget.selectedList);
    _searchList.addAll(widget.masterList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10.sp,
        ),
        TextField(
          onChanged: (String value) {
            if (value.isEmpty) {
              _searchList.clear();
              _searchList.addAll(widget.masterList);
            } else {
              _searchList = widget.masterList.where((String element) {
                return element.toLowerCase().contains(value.toLowerCase());
              }).toList();
            }
            setState(() {});
          },
          decoration: InputDecoration(
            isCollapsed: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.sp),
            ),
            // fillColor: context.colorScheme.secondary,
            hintText: 'Search...',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.sp,
              vertical: 8.sp,
            ),
          ),
        ).paddingBySide(left: 8.sp, right: 8.sp, bottom: 10.sp),
        Flexible(
          child: ListView.builder(
            itemCount: _searchList.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.sp,
                vertical: 4.sp,
              ),
              color: _selectedList.contains(_searchList[index])
                  ? context.colorScheme.primary.withOpacity(0.1)
                  : null,
              margin: EdgeInsets.only(bottom: 4.sp),
              child: InkWell(
                onTap: () {
                  if (_selectedList.contains(_searchList[index])) {
                    _selectedList.remove(_searchList[index]);
                  } else {
                    _selectedList.add(_searchList[index]);
                  }
                  setState(() {});
                  widget.onTap.call(_searchList[index]);
                },
                child: Row(
                  children: [
                    Text(
                      _searchList[index],
                      style: context.bodyLarge,
                    ),
                    const Spacer(),
                    if (_selectedList.contains(_searchList[index]))
                      const Icon(Icons.check)
                  ],
                ),
              ),
            ),
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
