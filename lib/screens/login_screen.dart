import 'package:flutter/material.dart';
import 'package:simple_chat_app/screens/register_screen.dart';
import 'package:simple_chat_app/widgets/custom_button.dart';
import 'package:simple_chat_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff274460),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          const Center(
              child: Image(image: AssetImage('assets/images/scholar.png'))),
          const Text(
            "Simple Chat App",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontFamily: 'Pacifico'),
          ),
          const Spacer(
            flex: 2,
          ),
          const Row(
            children: [
              Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Pacifico',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const CustomTextField(textHint: "Email"),
          const SizedBox(
            height: 8,
          ),
          const CustomTextField(textHint: "Password"),
          const SizedBox(
            height: 24,
          ),
          const CustomButton(
            textButton: "Sign in",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't Have an account  ",
                  style: TextStyle(color: Colors.white)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const RegisterScreen();
                      },
                    ),
                  );
                },
                child: const Text("Sign Up",
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 16)),
              ),
            ],
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
