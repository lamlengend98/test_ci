import 'package:chat_gpt_app/core/theme.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/action_menu.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/answer_item.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/menu_drawer.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_dot/jumping_dot.dart';

part 'view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
