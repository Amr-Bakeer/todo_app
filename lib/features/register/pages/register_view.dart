import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/features/firebaseUtils.dart';
import 'package:todo_app/features/login/pages/login_view.dart';

import '../../../core/services/snack_bar_service.dart';
import '../../../core/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = "register";
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffdfecdb),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(
            "assets/images/auth_pattern.png",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 130, 20, 30),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Full Name",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hint: "Enter your full name",
                      suffixWidget: Icon(Icons.person),
                      onChanged: (value) {
                        print(nameController.text);
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Email",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: "Enter your email address",
                      suffixWidget: const Icon(Icons.email),
                      onChanged: (value) {
                        print(emailController.text);
                      },
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your name";
                        }

                        var regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        if (!regex.hasMatch(value)) {
                          return "Invalid e-mail address";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Password",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      maxLines: 1,
                      hint: "Enter your password",
                      suffixWidget: const Icon(Icons.email_outlined),
                      onChanged: (value) {
                        print(passwordController.text);
                      },
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your password !";
                        }

                        var regex = RegExp(
                            r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                        if (!regex.hasMatch(value)) {
                          return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 8 characters long.";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Confirm Password",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomTextField(
                      controller: confirmPasswordController,
                      isPassword: true,
                      maxLines: 1,
                      hint: "Confirm your password",
                      suffixWidget: const Icon(Icons.email_outlined),
                      onChanged: (value) {
                        print(confirmPasswordController.text);
                      },
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "the password is not correct.";
                        }

                        if (value != passwordController.text) {
                          return "Password not matched";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseUtils()
                              .createUserAccount(
                            emailController.text,
                            passwordController.text,
                          )
                              .then((value) {
                            if (value) {
                              EasyLoading.dismiss();
                              SnackBarServices.showSuccessMessage(
                                "Account successfully created !",
                              );
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                LoginView.routeName,
                                (route) => false,
                              );
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Account",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
