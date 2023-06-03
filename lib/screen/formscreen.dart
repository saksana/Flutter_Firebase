import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../model/student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Student myStudent = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ແບບຟອມບັນທຶກຄະແນນ"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("ຊື່", style: TextStyle(fontSize: 18)),
                TextFormField(
                  validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນຊື່"),
                  onSaved: (String? fname) {
                    myStudent.fname = fname!;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("ນາມສະກຸນ", style: TextStyle(fontSize: 18)),
                TextFormField(
                  validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນນາມສະກຸນ"),
                  onSaved: (String? lname) {
                    myStudent.lname = lname!;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("ອີເມວ", style: TextStyle(fontSize: 18)),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "ກະລຸນາປ້ອນອີເມວ"),
                    EmailValidator(errorText: "ຮູບແບບອີເມວບໍ່ຖືກຕ້ອງ")
                  ]),
                  onSaved: (String? email) {
                    myStudent.emai = email!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("ຄະແນນ", style: TextStyle(fontSize: 18)),
                TextFormField(
                  validator: RequiredValidator(errorText: "ກະລຸນາປ້ອນຄະແນນ"),
                  onSaved: (String? score) {
                    myStudent.score = score!;
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        //print(myStudent.fname);
                      }
                    },
                    child: const Text("ບັນທຶກຂໍ້ມູນ",
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
