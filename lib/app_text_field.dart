import 'package:api_client/sizer/sizer/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final String? label;
  final String? helperText;
  final bool isSecure;
  final int maxLength;
  final String? hint;
  final TextInputType? inputType;
  final String? initValue;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final Function(String)? onTextChanged;
  final Function(String)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final int? maxLine;

  // ignore: constant_identifier_names
  static const int MAX_LENGTH = 500;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.inputType,
    this.initValue = "",
    this.isSecure = false,
    this.controller,
    this.validator,
    this.maxLength = MAX_LENGTH,
    this.onTextChanged,
    this.onSaved,
    this.inputFormatters,
    this.suffix,
    this.prefix,
    this.focusNode,
    this.errorText,
    this.maxLine = 1,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _passwordVisibility;
  late ThemeData theme;

  late final FocusNode _focusNode;

  // late Color _borderColor;
  final double _borderSize = 0.5.sp;
  late String? _errorText;
  final ValueNotifier<Color> _borderColorNotifier =
      ValueNotifier(Colors.transparent);

  @override
  void initState() {
    super.initState();
    _errorText = widget.errorText;
    _passwordVisibility = !widget.isSecure;
    widget.controller?.text = widget.initValue ?? "";
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _borderColorNotifier.value = theme.colorScheme.onBackground;
        if ((_errorText ?? '').isNotEmpty) {
          _errorText = null;
        }
        setState(() {});
      } else {
        _borderColorNotifier.value = theme.dividerColor;
        setState(() {});
      }
    });
  }

  @override
  void didChangeDependencies() {
    theme = Theme.of(context);
    if ((_errorText ?? '').isEmpty) {
      _borderColorNotifier.value = theme.dividerColor;
    } else {
      _borderColorNotifier.value = theme.colorScheme.error;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: _borderColorNotifier,
          builder: (_, value, __) => Container(
            height: 50.sp,
            decoration: BoxDecoration(
              border: Border.all(color: value, width: _borderSize),
              borderRadius: BorderRadius.circular(8.sp),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
          child: TextFormField(
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            focusNode: _focusNode,
            controller: widget.controller,
            autocorrect: false,
            obscureText: !_passwordVisibility,
            keyboardType: widget.inputType,
            cursorColor: theme.colorScheme.onBackground,
            validator: (value) {
              String? validator = widget.validator?.call(value);
              final borderColor = validator != null
                  ? theme.colorScheme.error
                  : theme.colorScheme.onBackground;

              if (borderColor != _borderColorNotifier.value) {
                Future.delayed(const Duration(milliseconds: 5)).then(
                  (value) => _borderColorNotifier.value = borderColor,
                );
              }
              return validator;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLine,
            onChanged: (text) {
              widget.onTextChanged?.call(text);
            },
            onTapOutside: (_) => (primaryFocus?.hasFocus ?? false)
                ? primaryFocus?.unfocus()
                : null,
            decoration: InputDecoration(
              counterText: "",
              hintStyle: theme.textTheme.titleMedium,
              errorText: _errorText,
              labelText: widget.label,
              helperText: widget.helperText,
              labelStyle: theme.textTheme.bodyMedium,
              suffixIcon: ValueListenableBuilder(
                  valueListenable: widget.controller ?? TextEditingController(),
                  builder: (_, value, __) {
                    if (value.text.isNotEmpty) {
                      return InkWell(
                        onTap: () {
                          widget.controller?.clear();
                          _errorText = null;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          color: theme.colorScheme.secondary,
                          size: 20.sp,
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
              prefixIcon: widget.prefix,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _borderColorNotifier.dispose();
  }
}
