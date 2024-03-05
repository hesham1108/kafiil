import 'package:flutter/material.dart';
import 'package:kafiil/core/helpers/app_regex.dart';
import 'package:kafiil/core/helpers/spacing.dart';
import 'package:kafiil/core/widgets/app_text_form_field.dart';
import 'package:kafiil/features/auth/presentation/logic/cubit/auth_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.authCubit});
  final AuthCubit authCubit;
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.authCubit.phaseOneFormKey,
      child: Column(
        children: [
          AppTextFormField(
            label: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            controller: widget.authCubit.firstNameController,
          ),
          verticalSpace(18),
          // AppTextFormField(
          //   label: 'Phone number',
          //   validator: (value) {
          //     if (value == null ||
          //         value.isEmpty ||
          //         !AppRegex.isPhoneNumberValid(value)) {
          //       return 'Please enter a valid phone number';
          //     }
          //     return null;
          //   },
          //   controller: widget.authCubit.phoneController,
          // ),
          verticalSpace(18),
          AppTextFormField(
            label: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: widget.authCubit.emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: widget.authCubit.registerPasswordController,
            label: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(
                  () {
                    isPasswordObscureText = !isPasswordObscureText;
                  },
                );
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: widget.authCubit.passwordConfirmationController,
            label: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(
                  () {
                    isPasswordConfirmationObscureText =
                        !isPasswordConfirmationObscureText;
                  },
                );
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
