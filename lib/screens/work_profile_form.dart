import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shramikaya/screens/profile_page.dart';
import 'package:shramikaya/utils/colors.dart';

class WorkProfileForm extends StatefulWidget {
  const WorkProfileForm({super.key});

  @override
  State<WorkProfileForm> createState() => _WorkProfileFormState();
}

class _WorkProfileFormState extends State<WorkProfileForm> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];

  TextEditingController _controllerDisplayName = new TextEditingController();
  TextEditingController _controllerMobileNumber = new TextEditingController();
  TextEditingController _controllerAddress = new TextEditingController();
  String selectedValue = "USA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Work Profile",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _controllerDisplayName,
                          maxLength: 30,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: primaryColor),
                              hintText: "Display Name"),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _controllerMobileNumber,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: primaryColor),
                              hintText: "Mobile Number"),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _controllerAddress,
                          maxLines: 5,
                          maxLength: 50,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: primaryColor),
                              hintText: "Address"),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownButton(
                          isExpanded: true,
                          value: selectedValue,
                          items: menuItems,
                          hint: const Text("Choose the work Category"),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          style: const TextStyle(
                              fontSize: 20, color: primaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(295, 60),
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                            //padding: const EdgeInsets.all(16.0),
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          onPressed: () {
                            final displayName = _controllerDisplayName.text;
                            final mobile = _controllerMobileNumber.text;
                            final address = _controllerAddress.text;
                            final jobCategory = selectedValue;
                            final profileImage =
                                FirebaseAuth.instance.currentUser!.photoURL!;
                            if (displayName != "" &&
                                mobile != "" &&
                                address != "") {
                              createWorkProfile(
                                context: context,
                                name: displayName,
                                mobile: mobile,
                                address: address,
                                profile: profileImage,
                                jobCategory: jobCategory,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Fill All Fields!"),
                                  backgroundColor: primaryColor,
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Create Your Work Profile"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future createWorkProfile(
    {required BuildContext context,
    required String name,
    required String mobile,
    required String address,
    required String profile,
    required String jobCategory}) async {
  final uid = FirebaseAuth.instance.currentUser!.uid!;
  final docWorker = FirebaseFirestore.instance.collection("worker").doc(uid);
  final data = {
    "displayName": name,
    "mobileNumber": mobile,
    "address": address,
    "profileUrl": profile,
    "jobCategory": jobCategory,
  };

  await docWorker.set(data).then((value) => {Navigator.pop(context)});
}
