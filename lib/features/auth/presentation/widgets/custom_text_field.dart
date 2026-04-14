import 'package:flutter/material.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

enum InputType { text, email, password }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.padding,
    this.labelTextHint,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.controller,
  });
  final String? labelText;
  final String? labelTextHint;
  final EdgeInsetsGeometry? padding;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final InputBorder _defaultBorder = const OutlineInputBorder();
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: TextFormField(
        controller: widget.controller,
        textCapitalization: widget.textCapitalization,
        style: TextStyle(color: AppColors.textPrimary),
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          hintText: widget.labelTextHint,
          hintStyle: AppTextStyle.formHint.copyWith(color: AppColors.textHint),
          labelText: widget.labelText?.toUpperCase(),
          border: _defaultBorder,
          labelStyle: AppTextStyle.formLabel.copyWith(
            color: _isFocused ? AppColors.vibrantTeal : AppColors.textHint,
          ),
          errorBorder: _defaultBorder.copyWith(
            borderSide: BorderSide(
              color: AppColors.error.withValues(alpha: 0.7),
            ),
          ),
          enabledBorder: _defaultBorder.copyWith(
            borderSide: BorderSide(color: AppColors.textHint),
          ),
          focusedBorder: _defaultBorder.copyWith(
            borderSide: BorderSide(color: AppColors.vibrantTeal),
          ),
          disabledBorder: _defaultBorder,
          focusedErrorBorder: _defaultBorder.copyWith(
            borderSide: BorderSide(color: AppColors.error),
          ),
        ),
      ),
    );
  }
}
