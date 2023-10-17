import 'package:flutter/material.dart';
import 'package:shramikaya/utils/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notifications",
            style: TextStyle(color: primaryColor),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/No_Notifications.gif",
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      const Text(
                        "No Notifications Yet...!",
                        style: TextStyle(fontSize: 24, color: primaryColor),
                      )
                    ],
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
