import 'package:chat_app/service/auth/auth_service.dart';
import 'package:chat_app/service/chat/chat_service.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  final TextEditingController _controller = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatService.sendMessage(_controller.text, receiverID);
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildTextField(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String currentUserID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(currentUserID, receiverID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Waiting");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((message) => _buildMessageItem(message))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot message) {
    Map<String, dynamic> data = message.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  Widget _buildTextField() {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            hintText: "Enter a message",
            isHidden: false,
            controller: _controller,
          ),
        ),
        ElevatedButton(
          onPressed: sendMessage,
          child: Icon(Icons.send),
        )
      ],
    );
  }
}
