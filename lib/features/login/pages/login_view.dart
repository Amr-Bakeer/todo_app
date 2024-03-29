import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/core/services/snack_bar_service.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/firebaseUtils.dart';
import 'package:todo_app/features/layout_view.dart';
import 'package:todo_app/features/register/pages/register_view.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "login";
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({super.key});

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
            "Login",
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
                      "Welcome Back!",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 25,
                      ),
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
                      suffixWidget: const Icon(Icons.email_outlined),
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your email address";
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
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "You must enter your password !";
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
                              .loginUserAccount(
                            emailController.text,
                            passwordController.text,
                          )
                              .then((value) {
                            if (value == true) {
                              EasyLoading.dismiss();
                              SnackBarServices.showSuccessMessage(
                                "Successfully logged in",
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                LayoutView.routeName,
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
                            "Login",
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
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "OR",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.routeName);
                      },
                      child: Text(
                        "Create new account !",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
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
