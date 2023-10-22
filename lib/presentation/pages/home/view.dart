part of 'page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  final ScrollController listViewController = ScrollController();
  bool generatingAnswer = false;

  void jumpToBottom() {
    listViewController.animateTo(
      listViewController.position.maxScrollExtent * 2,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOutCirc,
    );
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) {
      return;
    }
    _textController.clear();

    setState(() {
      _messages.add(text);
      generatingAnswer = true;
    });
    jumpToBottom();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _messages.add('This is the answer from Chat GPT.');
          generatingAnswer = false;
        });
        jumpToBottom();
      },
    );
  }

  Widget _buildTextComposer() {
    return Container(
      color: AppTheme.composerBackground,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          color: AppTheme.composerBackground,
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textController,
                  // onSubmitted: _handleSubmitted,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'How can I help you?',
                    hintStyle: TextStyle(
                      color: AppTheme.composerGray,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  cursorColor: Theme.of(context).primaryColor,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Opacity(
                opacity: _textController.text.isNotEmpty ? 1 : 0.5,
                child: Container(
                  width: 50,
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: generatingAnswer
                        ? JumpingDots(
                            color: Colors.white,
                            radius: 5,
                            numberOfDots: 3,
                          )
                        : const Icon(
                            Icons.send,
                            color: AppTheme.composerGray,
                          ),
                    onPressed: _textController.text.isNotEmpty
                        ? () => _handleSubmitted(_textController.text)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MenuDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const SizedBox(
            width: 30,
            child: Image(
              image: AssetImage('assets/images/ic_menu.png'),
              color: Colors.white,
            ),
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Image(
                    image: AssetImage('assets/images/ic_chat_header.png'),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Chat GPT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Center(
              child: MenuAnchor(
                builder: (BuildContext context, MenuController controller,
                    Widget? child) {
                  return InkWell(
                    onTap: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: const SizedBox(
                      width: 25,
                      child: Image(
                        image: AssetImage('assets/images/ic_options.png'),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                alignmentOffset: Offset(-140, 10),
                menuChildren: const [
                  ActionMenuItem(
                    icon: SizedBox(
                      width: 20,
                      child: Image(
                        image: AssetImage('assets/images/ic_edit.png'),
                        color: AppTheme.grayIcon,
                      ),
                    ),
                    text: 'Rename',
                  ),
                  ActionMenuItem(
                    icon: SizedBox(
                      width: 20,
                      child: Image(
                        image: AssetImage('assets/images/ic_refresh.png'),
                        color: AppTheme.grayIcon,
                      ),
                    ),
                    text: 'Refresh',
                  ),
                  ActionMenuItem(
                    icon: SizedBox(
                      width: 20,
                      child: Image(
                        image: AssetImage('assets/images/ic_delete.png'),
                        color: AppTheme.grayIcon,
                      ),
                    ),
                    text: 'Delete',
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
        backgroundColor: AppTheme.composerHeader,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              color: AppTheme.chatBackground,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  controller: listViewController,
                  itemBuilder: (_, int index) => index % 2 == 0
                      ? QuestionItem(
                          text: _messages[index],
                        )
                      : AnswerItem(text: _messages[index]),
                  itemCount: _messages.length,
                ),
              ),
            ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }
}
