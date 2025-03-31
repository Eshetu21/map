import 'package:flutter/material.dart';

class SaveListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onMenuTapListener;
  final VoidCallback onTap;
  final Color iconColor;
  const SaveListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onMenuTapListener,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, size: 30, color: iconColor),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Icon(Icons.more_vert, size: 20),
            contentPadding: EdgeInsets.symmetric(horizontal: 28),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

