import 'package:flutter/material.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

enum InputType { text, email, password }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.padding,
    this.labelTextHint,
    this.controller,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputType = InputType.text,
  });

  final String labelText;
  final String? labelTextHint;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final InputType inputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode _focusNode;
  bool _isFocused = false;
  bool _isObscured = true;

  bool get _isPasswordField => widget.inputType == InputType.password;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() => _isFocused = _focusNode.hasFocus);

  OutlineInputBorder _border({Color? color, double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? AppColors.textHint, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        validator: widget.validator,
        textCapitalization: widget.textCapitalization,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        obscureText: _isPasswordField && _isObscured,
        style: AppTextStyle.formValue,
        decoration: InputDecoration(
          labelText: widget.labelText.toUpperCase(),
          hintText: widget.labelTextHint,
          labelStyle: AppTextStyle.formLabel.copyWith(
            color: _isFocused ? AppColors.vibrantTeal : AppColors.textHint,
          ),
          hintStyle: AppTextStyle.formHint,
          suffixIcon: _isPasswordField
              ? _VisibilityToggle(
                  isObscured: _isObscured,
                  isFocused: _isFocused,
                  onToggle: () => setState(() => _isObscured = !_isObscured),
                )
              : null,
          border: _border(),
          enabledBorder: _border(color: AppColors.textHint),
          focusedBorder: _border(color: AppColors.vibrantTeal, width: 1.5),
          errorBorder: _border(color: AppColors.error.withOpacity(0.7)),
          focusedErrorBorder: _border(color: AppColors.error, width: 1.5),
          disabledBorder: _border(color: AppColors.textDisabled),
          errorStyle: AppTextStyle.errorText,
        ),
      ),
    );
  }
}

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({
    required this.isObscured,
    required this.isFocused,
    required this.onToggle,
  });

  final bool isObscured;
  final bool isFocused;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: isFocused ? AppColors.vibrantTeal : AppColors.textHint,
      ),
      onPressed: onToggle,
    );
  }
}
