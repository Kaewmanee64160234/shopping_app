import 'package:cloht_app/users/authentication/siginup_screen.dart';
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

                //login screen sigin form
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                      child: Column(
                        children: [
                          //email password login btn
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
                                  height:
                                      20), //space between email and password
                              //password
                              TextFormField(
                                controller: passwordController,
                                obscureText: isObsecure.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your password";
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        isObsecure.value = !isObsecure.value;
                                        print(isObsecure.value);
                                      },
                                      child: Icon(
                                        isObsecure.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  prefixIcon: Icon(Icons.vpn_key_sharp,
                                      color: Colors.black),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
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
                                ),
                              ),
                              const SizedBox(height: 18),

                              Material(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                child: InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      print("Validated");
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                          SizedBox(height: 16),
                          // dont have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(SignUpScreen());
                                },
                                child: const Text(
                                  "Sign Up Here",
                                  style: TextStyle(
                                      color: Colors.purpleAccent,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          // are you an admin
                          const Text("OR",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Are you an admin?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Click Here",
                                  style: TextStyle(
                                      color: Colors.purpleAccent,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ])));
        }));
  }
}
