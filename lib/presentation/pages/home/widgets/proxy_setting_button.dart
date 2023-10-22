import 'package:chat_gpt_app/core/theme.dart';
import 'package:flutter/material.dart';

class ProxySettingButton extends StatefulWidget {
  const ProxySettingButton({super.key});

  @override
  State<ProxySettingButton> createState() => _ProxySettingButtonState();
}

class _ProxySettingButtonState extends State<ProxySettingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Proxy Setting',
                style: TextStyle(
                  fontSize: 20,
                  color: AppTheme.blackText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: const TextField(
                decoration: InputDecoration(
                  hintText: "YOUR_PROXY_SETTING",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppTheme.blackText),
                  ),
                ),
                cursorColor: Colors.black,
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.composerGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              actionsOverflowButtonSpacing: 50,
              actionsPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Row(
          children: [
            SizedBox(
              width: 20,
              child: Image(
                image: AssetImage('assets/images/ic_settings.png'),
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              'Proxy Setting',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
