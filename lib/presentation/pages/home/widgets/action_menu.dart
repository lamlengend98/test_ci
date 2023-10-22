import 'package:chat_gpt_app/core/theme.dart';
import 'package:flutter/material.dart';

class ActionMenuItem extends StatefulWidget {
  const ActionMenuItem(
      {super.key, required this.icon, required this.text, this.onPress});
  final Widget icon;
  final String text;
  final VoidCallback? onPress;

  @override
  State<ActionMenuItem> createState() => _ActionMenuItemState();
}

class _ActionMenuItemState extends State<ActionMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(
              width: 16,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.blackText,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
