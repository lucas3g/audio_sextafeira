// ignore_for_file: depend_on_referenced_packages

import 'package:audio_sextafeira/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInputWidget extends StatefulWidget {
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String hintText;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final List<TextInputFormatter>? inputFormaters;
  final Function(String?)? onFieldSubmitted;
  final Function(String?)? onChanged;
  final TextEditingController textEditingController;
  final String? campoVazio;
  final TextCapitalization textCapitalization;
  final Function()? onTap;
  final void Function()? onEditingComplete;
  final bool readOnly;
  final bool expands;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final bool? autoFocus;

  const MyInputWidget({
    Key? key,
    required this.focusNode,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    required this.label,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
    this.minLines,
    this.inputFormaters,
    this.onFieldSubmitted,
    this.onChanged,
    required this.textEditingController,
    this.campoVazio,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onEditingComplete,
    this.readOnly = false,
    this.expands = false,
    this.textInputAction,
    this.textAlignVertical = TextAlignVertical.center,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<MyInputWidget> createState() => _MyInputWidgetState();
}

class _MyInputWidgetState extends State<MyInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus!,
      textAlignVertical: widget.textAlignVertical!,
      expands: widget.expands,
      minLines: widget.minLines,
      readOnly: widget.readOnly,
      onEditingComplete: widget.onEditingComplete,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      validator: (value) {
        return null;
      },
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: widget.onTap,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormaters,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        counterText: '',
        hintText: widget.hintText,
        label: Text(widget.label),
        suffixIcon: widget.suffixIcon,
        filled: true,
        isDense: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade700,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppTheme.colors.primary,
          ),
        ),
      ),
    );
  }
}
