import 'package:flutter/material.dart';
import 'package:hdb/pages/home_page.dart';
import 'package:hdb/pages/memories_page.dart';
import 'package:hdb/pages/quotes_page.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback ontap;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.name,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(name, style: const TextStyle(color: Colors.white)),
      onTap: ontap,
    );
  }
}

class WholeDrawer extends StatelessWidget {
  const WholeDrawer({super.key, required this.dSize});

  final Size dSize;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF000C15),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: dSize.height / 20),
          DrawerMenuItem(
            icon: Icons.home_outlined,
            name: 'Home',
            ontap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.black, thickness: 1),
          const SizedBox(height: 10),
          DrawerMenuItem(
            icon: Icons.history_edu_outlined,
            name: 'Memories',
            ontap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MemoriesPage()),
                ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.black, thickness: 1),
          DrawerMenuItem(
            icon: Icons.format_quote_outlined,
            name: 'Quotes',
            ontap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuotesPage()),
                ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
