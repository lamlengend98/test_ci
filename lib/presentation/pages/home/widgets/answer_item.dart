import 'package:chat_gpt_app/core/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnswerItem extends StatefulWidget {
  const AnswerItem({super.key, required this.text});
  final String text;

  @override
  State<AnswerItem> createState() => _AnswerItemState();
}

class _AnswerItemState extends State<AnswerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.composerBackground,
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: SizedBox(
              width: 40,
              child: Image(
                image: AssetImage('assets/images/ic_chat_header.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const SizedBox(
            width: 25,
            child: Image(
              image: AssetImage('assets/images/ic_like.png'),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Transform.rotate(
            angle: -math.pi,
            child: const SizedBox(
              width: 25,
              child: Image(
                image: AssetImage('assets/images/ic_like.png'),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
