import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/route_names.dart';
import 'package:wealth_wave/core/common/widget/primary_button.dart';
import 'package:wealth_wave/core/common/widget/custom_text_field.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  static const _fieldPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 8,
  );

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  void _onCreateAccount() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Creating account for ${_nameCtrl.text}, ${_emailCtrl.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            const SizedBox(height: 36),

            Text(
              'Spend Smarter\nSave More',
              style: AppTextStyle.balance.copyWith(fontSize: 34),
              textAlign: TextAlign.center,
            ),

            Image.asset('assets/images/signup_image.png'),

            CustomTextField(
              controller: _nameCtrl,
              labelText: 'Your Name',
              padding: _fieldPadding,
              labelTextHint: 'John Doe',
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              inputType: InputType.text,
              validator: (v) =>
                  (v?.trim().isEmpty ?? true) ? 'Name is required' : null,
            ),

            CustomTextField(
              controller: _emailCtrl,
              labelText: 'Your Email',
              padding: _fieldPadding,
              labelTextHint: 'john.doe@example.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              inputType: InputType.email,
              validator: (v) {
                if (v?.trim().isEmpty ?? true) return 'Email is required';
                final valid = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                return valid.hasMatch(v!) ? null : 'Enter a valid email';
              },
            ),

            CustomTextField(
              controller: _passCtrl,
              labelText: 'Choose your Password',
              padding: _fieldPadding,
              labelTextHint: 'Choose a strong password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              inputType: InputType.password,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Password is required';
                if (v.length < 8) return 'At least 8 characters required';
                if (!RegExp(r'(?=.*[A-Z])(?=.*\d)').hasMatch(v)) {
                  return '1 uppercase letter and 1 number required';
                }
                return null;
              },
            ),

            CustomTextField(
              controller: _confirmPassCtrl,
              labelText: 'Confirm your Password',
              padding: _fieldPadding,
              labelTextHint: 'Re-enter your password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              inputType: InputType.password,
              validator: (v) =>
                  v != _passCtrl.text ? 'Passwords do not match' : null,
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: primaryButton(
                'Create Account',
                _onCreateAccount,
                AppColors.vibrantTeal,
                AppColors.textPrimary,
                radius: 24,
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already Have Account? ',
                  style: AppTextStyle.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(RouteNames.login);
                        },
                      style: AppTextStyle.buttonSecondary.copyWith(
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.vibrantTeal,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
