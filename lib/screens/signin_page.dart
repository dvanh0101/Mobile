import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:student_lite/widgets/customTextField.dart';
import 'package:student_lite/widgets/customsigninbutton.dart';
import 'package:student_lite/widgets/customsocialsigninoptions.dart';
import 'package:student_lite/widgets/customalreadyaccount.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() => _SigninPage();
}

class _SigninPage extends State<SigninPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoginFailed = false;
  bool isEmailFailed = false;
  bool isPhoneFailed = false;
  bool isConfirmPhoneFailed = false;

  String? usernameError;
  String? passwordError;
  String? emailError;
  String? phoneError;
  String? confirmPasswordError;
  bool usernameHasError = false;
  bool passwordHasError = false;
  bool emailHasError = false;
  bool phoneHasError = false;
  bool confirmPasswordHasError = false;

  final formKey = GlobalKey<FormState>();

  void _validateForm() {
    setState(() {
      usernameHasError = usernameController.text.isEmpty;
      passwordHasError = passwordController.text.isEmpty;
      confirmPasswordHasError = confirmPasswordController.text.isEmpty;
      emailHasError = emailController.text.isEmpty;
      phoneHasError = phoneController.text.isEmpty;

      usernameError = usernameHasError ? "Username is required" : null;
      passwordError = passwordHasError ? "Password is required" : null;
      confirmPasswordError = confirmPasswordHasError ? "ConfirmPassword is required" : null;
      emailError = emailHasError ? "Email is required" : null;
      phoneError = phoneHasError ? "Phone is required" : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConfigColor.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    label: 'Username',
                    controller: usernameController,
                    errorText: usernameError,
                    hasError: usernameHasError,
                    icon: Icons.person,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Phone number',
                    controller: phoneController,
                    errorText: phoneError,
                    hasError: phoneHasError,
                    icon: Icons.phone,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    errorText: emailError,
                    hasError: emailHasError,
                    icon: Icons.email,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    errorText: passwordError,
                    hasError: passwordHasError,
                    icon: Icons.lock,
                    obscureText: !isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    errorText: confirmPasswordError,
                    hasError: confirmPasswordHasError,
                    icon: Icons.lock,
                    obscureText: !isConfirmPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomSignInButton(
                    formKey: formKey,
                    isLoginFailed: isLoginFailed,
                    validateForm: _validateForm,
                  ),
                  const SizedBox(height: 25),
                  const CustomSocialSigninOptions(),
                  const SizedBox(height: 20),
                  const CustomAlreadyAccount(),
                ],
              ),
              )
            )
        ),)
    );
  }
} 