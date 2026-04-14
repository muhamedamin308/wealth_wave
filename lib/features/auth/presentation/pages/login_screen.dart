import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/route_names.dart';
import 'package:wealth_wave/core/common/widget/primary_button.dart';
import 'package:wealth_wave/core/common/widget/custom_text_field.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  static const _fieldPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 8,
  );

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Logging in with ${_emailCtrl.text}');
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

            Image.asset('assets/images/login_image.png'),

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
              labelText: 'Your Password',
              labelTextHint: 'Enter your password',
              padding: _fieldPadding,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              inputType: InputType.password,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Password is required';
                if (v.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: primaryButton(
                'Login',
                _onLoginPressed,
                AppColors.vibrantTeal,
                AppColors.textPrimary,
                radius: 24,
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t Have an Account? ',
                  style: AppTextStyle.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(RouteNames.signup);
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
