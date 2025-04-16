import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart';
import 'package:flexcorex/widgets/chatbot_bubble.dart';

class FlexAIChatPage extends StatefulWidget {
  const FlexAIChatPage({Key? key}) : super(key: key);

  @override
  _FlexAIChatPageState createState() => _FlexAIChatPageState();
}

class _FlexAIChatPageState extends State<FlexAIChatPage> {
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hey, I’m FlexAI. Ready to thrive?",
      isUser: false,
    ),
  ];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _messages.add(ChatMessage(text: "...", isUser: false));
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.removeLast();
        _messages.add(ChatMessage(text: "This is a response to: '$text'", isUser: false));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.richCharcoalGray,
      appBar: AppBar(
        title: const Text("FlexAI"),
        backgroundColor: AppColors.matteBlack,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => ChatBubble(message: _messages[_messages.length - 1 - index]),
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: AppColors.matteBlack,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration.collapsed(
                  hintText: "Send a message",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic, color: AppColors.champagneGold),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.send, color: AppColors.champagneGold),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}