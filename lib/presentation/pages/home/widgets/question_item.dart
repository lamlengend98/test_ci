import 'package:flutter/material.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key, required this.text});
  final String text;

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const SizedBox(
            width: 40,
            child: Image(
              image: AssetImage('assets/images/ic_user.png'),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
