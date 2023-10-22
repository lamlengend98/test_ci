import 'package:chat_gpt_app/core/theme.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/api_key_button.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/conversation_item.dart';
import 'package:chat_gpt_app/presentation/pages/home/widgets/proxy_setting_button.dart';
import 'package:flutter/material.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      color: AppTheme.chatBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppTheme.composerBackground,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Image(
                        image: AssetImage('assets/images/ic_plus.png'),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'New chat',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.filled(20, 0)
                        .asMap()
                        .entries
                        .map(
                          (conversation) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = conversation.key;
                              });
                            },
                            child: ConversationItem(
                                nameConversation:
                                    'Conversation ${conversation.key}',
                                selected: selected == conversation.key),
                          ),
                        )
                        .toList(),
                  ],
                ),
              )),
              const ApiKeyButton(),
              const ProxySettingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
