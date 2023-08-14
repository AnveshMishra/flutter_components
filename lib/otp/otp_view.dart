import 'package:api_client/otp/otp_node.dart';
import 'package:flutter/material.dart';

class OtpView extends StatefulWidget {
  final int totalOtpField;
  const OtpView({super.key, required this.totalOtpField});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  List<TextEditingController> listTextEdit = [];
  List<FocusNode> listFocusNode = [];

  @override
  void initState() {
    super.initState();
    for (var index = 0; index < widget.totalOtpField; index++) {
      listTextEdit.add(TextEditingController());
      listFocusNode.add(FocusNode());
    }
    for (final textController in listTextEdit) {
      textController.text = '';
    }
    listFocusNode.first.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < widget.totalOtpField; index++)
          OtpNode(
            controller: listTextEdit[index],
            onChanged: (value) => onChange(
              index: index,
              textValue: value,
            ),
            focusNode: listFocusNode[index],
            onTapClick: () => onTapHandler(selectedIndex: index),
            index: index,
          ),
      ],
    );
  }

  void onChange({
    required int index,
    required String textValue,
  }) {
    if (textValue.length >= widget.totalOtpField) {
      for (int counter = 0; counter < widget.totalOtpField; counter++) {
        listTextEdit[counter].text = ' ${textValue[counter]}';
      }
      otpCheck();
      // widget.autoDetectOtp();
    } else {
      if (textValue.isNotEmpty) {
        listTextEdit[index].text = textValue.trim().characters.last;
        if (index < widget.totalOtpField - 1) {
          if (listTextEdit[index + 1].text.trim().isEmpty) {
            listTextEdit[index + 1].text = ' ';
          }
          listFocusNode[index + 1].requestFocus();
        } else {
          listFocusNode[index].unfocus();
        }
      } else if (textValue.trim().isEmpty) {
        if (index > 0) {
          listFocusNode[index - 1].requestFocus();
        }
      }
      otpCheck();
    }
  }

  void otpCheck() {
    final buffer = StringBuffer();
    for (final textController in listTextEdit) {
      buffer.write(textController.text.trim());
    }
    if (buffer.toString().trim().length == widget.totalOtpField &&
        (primaryFocus?.hasFocus ?? false)) {
      primaryFocus?.unfocus();
    }
  }

  void onTapHandler({required int selectedIndex}) {
    for (int index = 1; index < listTextEdit.length; index++) {
      if (listTextEdit[index].text.isEmpty) {
        listTextEdit[index].text =
            ' '; // in this case space is need to achieve back press functionality
      }
    }
    if (selectedIndex == 0) {
      // OTP will nor be auto read in ios if we add space in first textfield.
      // widget.listTextEdit[selectedIndex].text = '';
      listTextEdit[selectedIndex].value = TextEditingValue(
        selection: TextSelection.fromPosition(
          const TextPosition(offset: ''.length),
        ),
      );
    } else {
      listTextEdit[selectedIndex].value = TextEditingValue(
        text: ' ',
        selection: TextSelection.fromPosition(
          const TextPosition(offset: ' '.length),
        ),
      );
    }

    otpCheck();
  }
}
