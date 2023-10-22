import 'package:chat_gpt_app/core/theme.dart';
import 'package:flutter/material.dart';

class ConversationItem extends StatefulWidget {
  const ConversationItem(
      {super.key, required this.nameConversation, required this.selected});
  final String nameConversation;
  final bool selected;

  @override
  State<ConversationItem> createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.selected ? AppTheme.green : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
            child: Image(
              image: AssetImage('assets/images/ic_default_user.png'),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            widget.nameConversation,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
