import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({key}) : super(key: key);
  static const String id = 'chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User user;

  @override
  void initState() {
    initializeChatPage();
    super.initState();
  }

  void initializeChatPage() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Center(
        child: Text('Welcome ${user.email}'),
      ),
    );
  }
}
