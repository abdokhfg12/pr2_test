import 'dart:convert';
import 'dart:ffi';

import 'package:fhgfh/model/llogin_response.dart';
import 'package:fhgfh/model/signup_response.dart';
import 'package:fhgfh/screen/homepage.dart';
import 'package:fhgfh/screen/list_task%20(2).dart';
import 'package:fhgfh/screen/login_screen%20(5)%20(1).dart';
import 'package:fhgfh/xalues/customc%20(1).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String name ="";
  String email = "";
  String password = "";
  String phone= "";

  bool isPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1000,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft, end: Alignment.bottomRight, colors
                    : [customco.black,customco.blue]),

              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "assets/images/Logo White.png",
                  width: 80,
                  height:80,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.0,
                        ),
                        Center(
                          child: Text(
                            "sign up",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),SizedBox(
                    height: 8.0,
                  ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Container(
                      color:customco.bacclo,
                      margin: EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_off_outlined),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.contains("123456789")) {
                            return "Enter Valid Name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            name = value!;
                          });
                        },
                      ),
                    ),
                       SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 16.0),
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Container(
                          color:customco.bacclo,
                          margin: EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains("@")) {
                                return "Enter Valid Email";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                email = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height:8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 16.0),
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Container(
                          color:customco.bacclo,
                          margin: EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Valid Password";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value!;
                              });
                            },
                            keyboardType: TextInputType.text,
                            obscureText: isPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_open_rounded),
                              suffixIcon: GestureDetector(
                                child: Icon(isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                onTap: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),SizedBox(
                  height: 8.0,
                ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Text(
                      "PHONE",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Container(
                    color:customco.bacclo,
                    margin: EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      onSaved: (value) {
                        setState(() {
                          phone = value!;
                        });
                      },
                    ),
                  ),
                        SizedBox(height: 8.0,),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: isLoading ? const Center(child: CircularProgressIndicator(),): ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                  signup();
                                }
                              },
                              child: Text("SIGN up",style: TextStyle(color: customco.bacclo),),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(customco.black)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreeeen()));
                    },
                    child:Center(
                      child: const Text(" already have an account? Login",style: TextStyle(color: customco.bacclo,
                          fontWeight: FontWeight.bold,fontSize:15),
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
  Future signup()async{
    setState(() {
      isLoading=true;
    });
    Response signupResp =await post(Uri.parse("http://alcaptin.com/api/register"),body: {
      "first_name":"ahmed",
      "last_name":"Flora",
      "email":email,
      "password":password,
      "gender":"male",
      "age":"28",
      "phone":phone,

    },headers: {
      "Accept":"application/json"
    });
    dynamic conver =jsonDecode(signupResp.body);
    if(signupResp.statusCode == 200) {
      SignupResponse yasx =SignupResponse.fromJson(conver);
      print("WELCOME${yasx.data?.image}");
      Navigator.push(context, MaterialPageRoute(builder: (_)=>ListTask(accesstoken: yasx.data!.image,)));
    }

    }
}
