import 'package:flutter/material.dart';
import 'menu.dart';
import 'profile.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black, // AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCardButton(
              context,
              icon: Icons.menu,
              label: 'Menu',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              ),
            ),
            const SizedBox(height: 16),
            _buildCardButton(
              context,
              icon: Icons.person,
              label: 'Profile',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ),
            ),
            const SizedBox(height: 16),
            _buildCardButton(
              context,
              icon: Icons.settings,
              label: 'Settings',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(label, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
        onTap: onPressed,
      ),
    );
  }
}