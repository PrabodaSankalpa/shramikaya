import 'package:flutter/material.dart';
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
      body: Column(
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
                      const TextField(
                        maxLength: 30,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: primaryColor),
                            hintText: "Display Name"),
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: primaryColor),
                            hintText: "Mobile Number"),
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextField(
                        maxLines: 5,
                        maxLength: 50,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: primaryColor),
                            hintText: "Address"),
                        style: TextStyle(fontSize: 20),
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
                        style:
                            const TextStyle(fontSize: 20, color: primaryColor),
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
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text("Create Your Work Profile"),
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
    );
  }
}
