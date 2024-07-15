import 'package:flutter/material.dart';



class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final List<String> _questions = [
    "Do you have any experience with Flutter?",
    "Have you worked in a team environment?",
    "Are you comfortable with remote work?"
  ];
  int _currentQuestionIndex = 0;
  final TextEditingController _controller = TextEditingController();

  void _handleSendMessage() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add(Message(text: _controller.text, isMe: true));
      _controller.clear();
      if (_currentQuestionIndex < _questions.length) {
        _messages.add(Message(text: _questions[_currentQuestionIndex], isMe: false));
        _currentQuestionIndex++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Add the first question when the chat screen is initialized
    _messages.add(Message(text: _questions[_currentQuestionIndex], isMe: false));
    _currentQuestionIndex++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Company'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _handleSendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
