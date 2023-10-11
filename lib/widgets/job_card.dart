import 'package:flutter/material.dart';
import 'package:shramikaya/utils/colors.dart';

class JobCard extends StatefulWidget {
  const JobCard({super.key});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        color: Colors.white,
        child: const Center(
          child: Text(
            "Job Details",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
