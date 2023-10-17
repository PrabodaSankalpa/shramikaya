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
        width: double.infinity,
        height: 280,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 5.0, color: Colors.grey),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/avatar.jpg"),
                        ),
                      ),
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Chamara Signhabahu',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Text(
                "Level one seller",
                style: TextStyle(color: secondaryColor),
              ),
              const Text(
                "Mount Satellite Dish",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Baloo",
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(Icons.category),
                    SizedBox(
                      width: 10,
                    ),
                    Text("TV and Radio"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.price_change_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Rs 1000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Horana",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check_circle),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "10 Orders",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                    ),
                    label: const Text("Call"),
                    icon: const Icon(Icons.call),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                    ),
                    label: const Text("Comments"),
                    icon: const Icon(Icons.comment),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                    ),
                    label: const Text("More"),
                    icon: const Icon(Icons.read_more),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
