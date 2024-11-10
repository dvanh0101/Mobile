import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoginFailed = false;

  String? usernameError; // Lỗi username
  String? passwordError; // Lỗi password
  bool usernameHasError = false;
  bool passwordHasError = false;

  final formKey = GlobalKey<FormState>();

  void _validateForm() {
    setState(() {
      usernameHasError = usernameController.text.isEmpty;
      passwordHasError = passwordController.text.isEmpty;

      usernameError = usernameHasError ? "Username is required" : null;
      passwordError = passwordHasError ? "Password is required" : null;
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
                  _buildTextField(
                    label: 'Username or email address',
                    controller: usernameController,
                    errorText: usernameError,
                    hasError: usernameHasError,
                    icon: Icons.person,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
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
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildForgotPassword(),
                  const SizedBox(height: 25),
                  _buildLoginButton(),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: StyleConfigColor.gray,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Or",
                          style: StyleConfigText.title3,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: StyleConfigColor.gray,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  _buildSocialLoginOptions(),
                  const SizedBox(height: 20),
                  _buildSignUpRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? errorText,
    bool hasError = false,
    required IconData icon,
    required bool obscureText,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: StyleConfigText.bodyTextRegular1),
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: hasError
                  ? StyleConfigColor.warning
                  : StyleConfigColor.textLight6,
              width: 1.5,
            ),
            color: StyleConfigColor.text2,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(icon, color: StyleConfigColor.gray),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        if (hasError || errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(
              errorText ?? '',
              style: TextStyle(color: StyleConfigColor.warning),
            ),
          ),
      ],
    );
  }


  Widget _buildLoginButton() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: StyleConfigColor.primary,
      ),
      child: TextButton(
        onPressed: () {

          if (formKey.currentState!.validate()) {
            // login();
            isLoginFailed = true;
            _validateForm();
          }
          _validateForm();
        },
        child: Text("Login",
            style:
                StyleConfigText.title3.copyWith(color: StyleConfigColor.text2)),
      ),
    );
  }

  Widget _buildSocialLoginOptions() {
    return Column(
      children: [
        _buildSocialLoginButton(
            'assets/images/facebook_icon.png', "Login with Facebook"),
        _buildSocialLoginButton(
            'assets/images/google_icon.png', "Login with Google"),
        _buildSocialLoginButton(
            'assets/images/apple_icon.png', "Login with Apple"),
      ],
    );
  }

  Widget _buildSocialLoginButton(String imagePath, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 390,
        height: 60,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border.all(color: StyleConfigColor.text2Dark2),
          borderRadius: BorderRadius.circular(8),
          color: StyleConfigColor.text2,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 64),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imagePath,
                      width: 40, height: 40, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(text,
                    style: StyleConfigText.bodyTextBlack1,
                    textAlign: TextAlign.start),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.textLight3),),
        TextButton(
          onPressed: () {},
          child: Text("Sign up", style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.primary),),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            // Chuyển hướng tới màn hình đăng ký
          },
          child: Text(
            "Forgot password",
            style: StyleConfigText.bodyTextRegular2.copyWith(
                color: StyleConfigColor.primary,
                decoration: TextDecoration.underline),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

