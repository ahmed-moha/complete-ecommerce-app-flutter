import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/user.dart';
import 'package:ecommerce_app/src/views/home.dart';
import 'package:ecommerce_app/src/views/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, user, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login Screen",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: user.loginFormKey,
            child: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(
                  height: kPadding,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: const Text(
                    "Please enter your username and password to sign in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    controller: user.username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon:
                          const Icon(IconlyBold.profile, color: kPrimaryColor),
                      hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.65),
                          fontWeight: FontWeight.w300),
                      //border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    controller: user.password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon:
                          const Icon(IconlyBold.lock, color: kPrimaryColor),
                      hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.65),
                          fontWeight: FontWeight.w300),
                      //border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: kPadding, vertical: kPadding),
                  alignment: Alignment.topRight,
                  child: TextButton(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () {}),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => user.login(success: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false);
                    }),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: user.isLoginLoading
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.0,
                            ))
                        : const Text("Sign in"),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        color: Colors.black,
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.center,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: const Text("OR"),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        onTap: () => user.google(success: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Home()));
                        }),
                      ),
                      const SizedBox(
                        width: kPadding,
                      ),
                      const SocialCard(
                        icon: FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
              child: const Text(
                "Register",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.onTap,
    required this.icon,
    this.color,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: color ?? Colors.blue),
            shape: BoxShape.circle),
        child: Icon(icon, color: color, size: 29),
      ),
    );
  }
}
