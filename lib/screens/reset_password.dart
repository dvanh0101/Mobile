import 'package:flutter/material.dart';
import 'package:student_lite/widgets/input_box.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController pass = TextEditingController();
  final TextEditingController comfirmPass = TextEditingController();

  bool _isButtonEnabled = false;
  bool _isObscure = true;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    pass.addListener(_updateButtonState);
    comfirmPass.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = pass.text.isNotEmpty && comfirmPass.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    pass.dispose();
    comfirmPass.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          scrolledUnderElevation: 7,
          elevation: 7,
          leading: IconButton(
            padding: const EdgeInsets.all(2.67),
            icon: Image.asset('assets/icons/Icon.png',
                width: 21.82, height: 21.82),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password reset',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2A2A2A),
                  )),
              const SizedBox(height: 10),
              const Text('Passwords must include characters and numbers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff2A2A2A),
                  )),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller: pass,
                  textAlign: TextAlign.start,
                  focusNode: FocusNode(),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    hintText: 'Password',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    filled: true,
                    fillColor: Colors.white,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto-Light',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller: comfirmPass,
                  textAlign: TextAlign.start,
                  focusNode: FocusNode(),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    hintText: 'Password',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    filled: true,
                    fillColor: Colors.white,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto-Light',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text(
                  'Sign out of your devices, select this if someone else has ever signed in to your account.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff2A2A2A),
                  ),
                ),
                value: _agreeToTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _agreeToTerms = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.all(0),
                tileColor: Colors.white,
                checkColor: Colors.black,
                activeColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? () {} : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isButtonEnabled
                          ? Color(0xff8E44E8)
                          : Color.fromARGB(255, 192, 160, 231),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(343, 48)),
                  ),
                  child: const Text('Update password',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
