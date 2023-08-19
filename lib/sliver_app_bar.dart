import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:api_client/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar(
      {super.key,
      required this.controller,
      this.hideClose = false,
      this.title});

  final ScrollController controller;
  final bool hideClose;
  final String? title;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  bool isCommpressed = false;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.offset >= kToolbarHeight - 32.sp) {
        isCommpressed = true;
        setState(() {});
      } else {
        if (isCommpressed == true) {
          isCommpressed = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: context.colorScheme.background,
      pinned: true,
      expandedHeight: kToolbarHeight + 32.sp,
      centerTitle: false,
      titleSpacing: 0,
      title: (isCommpressed && widget.title != null)
          ? Text(
              widget.title ?? '',
              style: context.headlineLarge,
            )
          : null,
      leading: !(widget.hideClose)
          ? IconButton(
              color: context.colorScheme.onBackground,
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close),
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.sp),
        title: (!isCommpressed && widget.title != null)
            ? Text(
                widget.title ?? '',
                style: context.headlineSmall,
              )
            : null,
      ),
    );
  }
}
