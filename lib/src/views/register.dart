import 'package:ecommerce_app/src/constants.dart';
import 'package:ecommerce_app/src/controllers/user.dart';
import 'package:ecommerce_app/src/views/login.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, user, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Register Screen",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: user.registerFormKey,
            child: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  child: const Text(
                    "Please enter your name, email , username and password to sign in",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
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
                    controller: user.rName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
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
                    controller: user.rUsername,
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
                    controller: user.rEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "E-mail is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      prefixIcon:
                          const Icon(IconlyBold.message, color: kPrimaryColor),
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
                    controller: user.rPassword,
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
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: kPadding),
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => user.register(context),
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
                        : const Text("Submit"),
                  ),
                ),
               
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));},
              child: const Text(
                "Login",
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
