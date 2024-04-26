import 'package:chat_app/service/auth/auth_service.dart';
import 'package:chat_app/service/chat/chat_service.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      drawer: CustomDrawer(),
      body: _buildUserList(),
    );
  }

  // method to build list of users
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error!");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Waiting...");
        }

        return ListView(
          children:
              snapshot.data!.map<Widget>((userData) => _buildUserItem).toList(),
        );
      },
    );
  }

  Widget _buildUserItem(Map<String, dynamic> userData, BuildContext context) {
    return ListTile();
  }
}
