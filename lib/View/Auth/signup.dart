import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Const/Colors.dart';
import '../../Const/const.dart';
import '../../Model/model.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_text_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  bool obsecure = false;
  bool obsecure2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: top),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome To Trippy",
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Sign up you fresh account in few mins",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: grey,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomTextFieldd(
                  // ab: obsecure,
                  controller: email,
                  text: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: black,
                  ),
                  ab: false,
                ),
                SizedBox(
                  height: 19.h,
                ),
                CustomTextFieldd(
                  ab: obsecure,
                  controller: pass,
                  text: 'Password',
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                      child: obsecure
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: grey,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: grey,
                            )),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 20,
                    color: black,
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                // CustomTextFieldd(
                //   ab: obsecure2,
                //   controller: cnfrmpass,
                //   text: 'Confirm Password',
                //   suffixIcon: InkWell(
                //       onTap: () {
                //         setState(() {
                //           obsecure2 = !obsecure2;
                //         });
                //       },
                //       child: obsecure2
                //           ? const Icon(
                //               Icons.visibility_off_outlined,
                //               color: grey,
                //             )
                //           : const Icon(
                //               Icons.visibility_outlined,
                //               color: grey,
                //             )),
                //   prefixIcon: const Icon(
                //     Icons.lock_outline,
                //     size: 20,
                //     color: black,
                //   ),
                // ),
                SizedBox(
                  height: 18.h,
                ),

                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: grey,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          // Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          " Sign In",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: primary,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                // InkWell(
                //   onTap: () async {
                //     // googleSignin.handleSignIn(context);
                //   },
                //   child: Container(
                //     height: 200,
                //     width: 100,
                //     color: Colors.black,
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      _auth
                          .createUserWithEmailAndPassword(
                              email: email.text, password: pass.text)
                          .then((value) {
                        postDetailToFirestore();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: ((context) => ())));
                      }).onError((error, stackTrace) {
                        // Utils().toastMessag(error.toString());
                      });
                      print('hello');
                    }

                    // postDetailToFirestore();

                    // Get.toNamed(AppRoutes.home);
                  },
                  child: const Button(
                    colors: primary,
                    button_text: 'Sign Up',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'By continuing,  you agree to the Tippy Inc',
                        style: TextStyle(
                            height: 1.3, color: grey, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: '\n   Terms and condition ',
                            style: TextStyle(color: primary, fontSize: 14.sp),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(color: grey, fontSize: 14.sp),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: primary, fontSize: 14.sp),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  postDetailToFirestore() async {
    //calling our firestore
    //calling our usermodel
    //sedning these values
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = auth.currentUser;

    Usermodel usermodel = Usermodel();

    // writing all the values
    usermodel.email = email.text;
    usermodel.uid = user!.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());

    Fluttertoast.showToast(msg: 'Account created Successfully ');
  }
}
