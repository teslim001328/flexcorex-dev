import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/chat_bubble.dart';

class FlexAIChatPage extends StatefulWidget {
  const FlexAIChatPage({Key? key}) : super(key: key);

  @override
  _FlexAIChatPageState createState() => _FlexAIChatPageState();
}

class _FlexAIChatPageState extends State<FlexAIChatPage> {
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Hey, I’m FlexAI. Ready to thrive?", isUser: false),
  ];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;

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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text("FlexAI"),
        backgroundColor: theme.appBarTheme.backgroundColor,
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
          Container(
            decoration: BoxDecoration(color: theme.colorScheme.surface),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildTextComposer(),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            style: TextStyle(color: theme.colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: "Send a message",
              hintStyle: TextStyle(color: theme.hintColor),
              border: InputBorder.none,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: theme.primaryColor),
          onPressed: () {
            _handleSubmitted(_textController.text);
          },
        ),
      ],
    );
  }
}
            ),
          ],
        ),
      ),
    );
  }
}