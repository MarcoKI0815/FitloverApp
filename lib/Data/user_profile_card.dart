import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Luca",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Weight: 74 kg",
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text("Height: 1.85 m",
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: const AssetImage("assets/jhk.png"),
            backgroundColor: Colors.blue.shade800,
          ),
        ],
      ),
    );
  }
}
