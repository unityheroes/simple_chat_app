import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_chat_app/constants.dart';
import 'package:simple_chat_app/helpers/show_snack_bar.dart';
import 'package:simple_chat_app/screens/chat_screen.dart';
import 'package:simple_chat_app/screens/register_screen.dart';
import 'package:simple_chat_app/widgets/custom_button.dart';
import 'package:simple_chat_app/widgets/custom_form_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(
                height: 64,
              ),
              const Center(
                  child: Image(
                image: AssetImage(kLogoImage),
                height: 128,
              )),
              const Center(
                child: Text(
                  "Simple Chat App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Pacifico'),
                ),
              ),
              const SizedBox(
                height: 128,
              ),
              const Row(
                children: [
                  Text(
                    "Sign in ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CustomFormTextField(
                textHint: "Email",
                onChange: (data) => email = data,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFormTextField(
                textHint: "Password",
                onChange: (data) => password = data,
                obsecureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await loginUser();
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, "Success");
                      // ignore: use_build_context_synchronously
                      Navigator.popAndPushNamed(context, ChatPage.id,
                          arguments: email);
                    } on FirebaseAuthException catch (e) {
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, e.message.toString());
                    } catch (e) {
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, "Oops There Missing value ");
                    }
                  }
                  isLoading = false;
                  setState(() {});
                },
                textButton: "Login ",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" Don't have an account   ",
                      style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(
                            color: Colors.yellowAccent, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(email: email!, password: password!);
  }
}
