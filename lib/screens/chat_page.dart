import 'package:chatbot_demo/components/message_bubble.dart';
import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User user;
FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class ChatPage extends StatefulWidget {
  const ChatPage({key}) : super(key: key);
  static const String id = 'chat';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();
  String message;

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
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, LoginPage.id);
              },
              icon: Icon(Icons.close)),
        ],
        title: Text('Chatbot'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageBuilder(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                    decoration: kMessageTextFieldDecoration,
                    onChanged: (value) {
                      message = value;
                    },
                  )),
                  TextButton(
                    onPressed: () {
                      try {
                        _fireStore
                            .collection('messages')
                            .doc(user.uid)
                            .collection('usrMsgs')
                            .add({
                          'text': message,
                          'self': true,
                          'time': FieldValue.serverTimestamp(),
                        });
                        controller.clear();
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBuilder extends StatelessWidget {
  MessageBubble getMsgBubble(Map<String, dynamic> data, bool hideSender) {
    return MessageBubble(
      text: data['text'],
      isMe: data['isMe'],
      time: data['time'],
      hideSender: hideSender,
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      return StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection('messages')
            .doc(user.uid)
            .collection('usrMsgs')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
            );
          } else {
            List<MessageBubble> messageWidgets = [];
            List<Map<String, dynamic>> msgList = [];
            int listLength = 0;
            for (var msg in snapshot.data.docs.reversed) {
              final txt = msg.get('text');
              final isMe = msg.get('self');
              final time = msg.get('time');
              //final sender = msg.get('sender');
              msgList.add({
                'text': txt,
                //'sender': sender,
                'time': time,
                'isMe': isMe,
              });
              listLength = msgList.length;
              if (listLength > 1) {
                final last = msgList[listLength - 2];
                messageWidgets.add(getMsgBubble(last, last['isMe'] == isMe));
              }
            }
            if (listLength > 0)
              messageWidgets.add(getMsgBubble(msgList[listLength - 1], false));
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                children: messageWidgets,
              ),
            );
          }
        },
      );
    } catch (e) {
      print(e);
    }
    return Center(
      child: Text('Error fetching messages'),
    );
  }
}
