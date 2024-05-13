import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_chat_app/constants.dart';
import 'package:simple_chat_app/helpers/show_snack_bar.dart';
import 'package:simple_chat_app/screens/chat_screen.dart';

import 'package:simple_chat_app/widgets/custom_button.dart';
import 'package:simple_chat_app/widgets/custom_form_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    "Register",
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
                      await registerNewUser();
                      showSnackBar(context, "Success");
                      Navigator.popAndPushNamed(context, ChatPage.id);
                    } on FirebaseAuthException catch (e) {
                      showSnackBar(context, e.message.toString());
                    } catch (e) {
                      showSnackBar(context, "Oops There Missing value ");
                    }
                  }
                  isLoading = false;
                  setState(() {});
                },
                textButton: "Register Now",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" Have an exits account  ",
                      style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Sign in",
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

  Future<void> registerNewUser() async {
    var auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
