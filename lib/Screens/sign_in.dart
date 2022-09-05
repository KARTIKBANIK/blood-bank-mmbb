import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mmbb_app/Custom_Widgets/btn.dart';
import 'package:mmbb_app/Custom_Widgets/text_field.dart';
import 'package:mmbb_app/Screens/home_page.dart';
import 'package:mmbb_app/Screens/sign_up.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailCOntroller = TextEditingController();
  TextEditingController _passCOntroller = TextEditingController();

  // final Stream<QuerySnapshot> _courseStream =
  //     FirebaseFirestore.instance.collection('donarform').snapshots();

  donarRagistration() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) => SignUp(),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var obscureText = true;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/login_2.png'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          controller: _emailCOntroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          validator: Validators.compose(
                            [
                              Validators.required('email is required*'),
                              Validators.email('invalid email'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: obscureText,
                          controller: _passCOntroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                child: obscureText
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      )),
                          ),
                          validator: Validators.compose(
                            [
                              Validators.required('password is required*'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }
                          },
                          child: Text('Sign In'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  donarRagistration();
                },
                child: Text(
                  "Don't any account? Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
