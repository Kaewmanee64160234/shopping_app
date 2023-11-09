import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(builder: (context, cons) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: cons.maxHeight,
              ),
              child: SingleChildScrollView(
                  child: Column(children: [
                //login screen header
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 285,
                  child: Image.asset(
                    "images/uni.jpg",
                  ),
                ),

                //   //login screen sigin form
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(0, -3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(children: [
                          //email
                          TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.black),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 0),
                                fillColor: Colors.white,
                                filled: true,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              )),

                          SizedBox(
                              height: 20), //space between email and password
                          //password

                          TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: Obx(() => GestureDetector(
                                      onTap: () {
                                        isObsecure.value = !isObsecure.value;
                                        // controller.togglePassword();
                                      },
                                      child: Icon(
                                        isObsecure.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    )),
                                prefixIcon: Icon(Icons.vpn_key_sharp,
                                    color: Colors.black),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 0),
                                fillColor: Colors.white,
                                filled: true,
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              )),
                        ]),
                      )
                    ],
                  ),
                ),
              ])));
        }));
  }
}
