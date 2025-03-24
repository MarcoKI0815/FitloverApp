import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _navigateTo(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Navigating to $title")),
    );
    //  Navigator.push() verwenden, um zu echten Seiten zu navigieren.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color.fromARGB(255, 10, 20, 46),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Account",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 10),
          _buildSettingsItem(context, Icons.person, "Profile"),
          _buildSettingsItem(context, Icons.lock, "Password"),
          _buildSettingsItem(context, Icons.notifications, "Notifications"),
          _buildSettingsItem(context, Icons.help, "Help & Support"),
          _buildSettingsItem(context, Icons.mail, "Contact Us"),
          _buildSettingsItem(context, Icons.privacy_tip, "Privacy Policy"),
          _buildSettingsItem(context, Icons.star, "Rate & Review"),
          _buildSettingsItem(context, Icons.info, "Help"),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () => _navigateTo(context, title),
    );
  }
}
