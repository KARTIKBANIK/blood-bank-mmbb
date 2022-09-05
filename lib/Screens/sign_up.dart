import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmbb_app/Custom_Widgets/drop_downnn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Stream<QuerySnapshot> _donarformStream =
      FirebaseFirestore.instance.collection('donarform').snapshots();

  TextEditingController _f_NameController = TextEditingController();
  TextEditingController _l_NameController = TextEditingController();
  TextEditingController _d_B_Controller = TextEditingController();
  TextEditingController _blood_groupController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  XFile? _donarImage;
  String? _imageUrl;

  chooseImageFromGC() async {
    ImagePicker _picker = ImagePicker();
    _donarImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  writeData() async {
    File imageFile = File(_donarImage!.path);

    FirebaseStorage storage = FirebaseStorage.instance;
    UploadTask uploadTask =
        storage.ref('donarform').child(_donarImage!.name).putFile(imageFile);

    TaskSnapshot snapshot = await uploadTask;

    _imageUrl = await snapshot.ref.getDownloadURL();

    CollectionReference _donar =
        FirebaseFirestore.instance.collection('donarform');

    _donar.add({
      'first_name': _f_NameController.text,
      'last_name': _l_NameController.text,
      'date_of_birth': _d_B_Controller.text,
      'blood_group': _blood_groupController,
      'phone_number': _l_NameController.text,
      'address': _phoneController.text,
      'donar_img': _imageUrl
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 500,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
            color: Color.fromARGB(255, 248, 220, 220),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            )),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 82,
                      backgroundColor: Colors.redAccent,
                      child: CircleAvatar(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () {
                              chooseImageFromGC();
                            },
                            child: _donarImage == null
                                ? Container(
                                    decoration: BoxDecoration(),
                                    child: Image(
                                      image: AssetImage('images/person.png'),
                                    ),
                                  )
                                : Image.file(
                                    File(
                                      _donarImage!.path,
                                    ),
                                  ),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        radius: 80.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _f_NameController,
                        decoration: InputDecoration(
                          hintText: ' First Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Drop_Down(_blood_groupController),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _l_NameController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _d_B_Controller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    hintText: 'Date of Birth',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _blood_groupController,
                  decoration: InputDecoration(
                    hintText: 'Select Blood Group',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  maxLines: 3,
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      writeData();
                    },
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blueAccent,
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.red,
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.amber,
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
