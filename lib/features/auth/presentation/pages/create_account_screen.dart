import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/route_names.dart';
import 'package:wealth_wave/core/common/widget/custom_modal_bottom_sheet.dart';
import 'package:wealth_wave/core/common/widget/custom_circular_progress_indicator.dart';
import 'package:wealth_wave/core/common/widget/primary_button.dart';
import 'package:wealth_wave/core/common/widget/custom_text_field.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';
import 'package:wealth_wave/di/locator.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';
import 'package:wealth_wave/features/auth/presentation/bloc/authentication_state.dart';
import 'package:wealth_wave/features/auth/presentation/controller/authentication_controller.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _controller = locator.get<AuthenticationController>();

  static const _fieldPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 8,
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      switch (_controller.state) {
        case AuthenticationLoadingState():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
                const Center(child: CustomCircularProgressIndicator()),
          );
          break;

        case AuthenticationSuccessState():
          Navigator.of(context).pop(); // Close loading dialog
          CustomErrorBottomSheet.show(
            context,
            title: 'Account Creation Success',
            message:
                'Your account has been created successfully! You can now log in with your credentials.',
            isError: false,
          );
          break;

        case AuthenticationErrorState():
          Navigator.of(context).pop(); // Close loading dialog
          CustomErrorBottomSheet.show(
            context,
            title: 'Account Creation Failed',
            message: (_controller.state as AuthenticationErrorState).message,
            isError: true,
          );
          break;
      }
    });
  }

  void _onCreateAccount() {
    if (_formKey.currentState?.validate() ?? false) {
      _controller.doCreateAccount(
        _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passController.text,
      );
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
              'Start Saving\nYour Money!',
              style: AppTextStyle.balance.copyWith(fontSize: 34),
              textAlign: TextAlign.center,
            ),

            Image.asset('assets/images/signup_image.png'),

            SizedBox(height: 16),

            CustomTextField(
              controller: _nameController,
              labelText: 'Your Name',
              padding: _fieldPadding,
              labelTextHint: 'John Doe',
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              inputType: InputType.text,
              validator: (v) {
                if (v?.trim().isEmpty ?? true) return 'Name is required';
                final valid = RegExp(
                  r"(-?([A-Z].\s)?([A-Z][a-z]+)\s?)+([A-Z]'([A-Z][a-z]+))?",
                );
                return valid.hasMatch(v!) ? null : 'Enter a valid name';
              },
            ),

            CustomTextField(
              controller: _emailController,
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
              controller: _passController,
              labelText: 'Choose your Password',
              padding: _fieldPadding,
              labelTextHint: 'Choose a strong password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              inputType: InputType.password,
              helperText:
                  'Must have at least 8 characters, 1 capital letter and 1 number.',
              validator: (v) {
                if (v == null || v.isEmpty) return 'Password is required';
                if (v.length < 8) return 'At least 8 characters required';
                if (!RegExp(r'(?=.*[A-Z])(?=.*\d)').hasMatch(v)) {
                  return '1 uppercase letter and 1 number required';
                }
                return null;
              },
              helperTextCondition: (v) =>
                  v.length < 8 || !RegExp(r'(?=.*[A-Z])(?=.*\d)').hasMatch(v),
            ),

            CustomTextField(
              controller: _confirmPassController,
              labelText: 'Confirm your Password',
              padding: _fieldPadding,
              labelTextHint: 'Re-enter your password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              inputType: InputType.password,
              validator: (v) =>
                  v != _passController.text ? 'Passwords do not match' : null,
              helperText: 'Passwords must match.',
              helperTextCondition: (v) => v != _passController.text,
            ),

            const SizedBox(height: 12),

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
                          context.pushReplacementNamed(NamedRoutes.login);
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
