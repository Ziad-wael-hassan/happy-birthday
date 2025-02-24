import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF000C15),
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text("2otety", style: TextStyle(color: Colors.white)),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xFF000C15),
                  title: const Center(
                    child: Text(
                      "2otety",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  content: Image.asset(
                    "assets/prof.jpg",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                );
              },
            );
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/prof.jpg"),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
