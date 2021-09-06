import 'package:chatbot_demo/components/circlular_button.dart';
import 'package:chatbot_demo/components/date_display.dart';
import 'package:chatbot_demo/components/message_bubble.dart';
import 'package:chatbot_demo/constants.dart';
import 'package:chatbot_demo/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

User user;
FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({key}) : super(key: key);
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  DialogflowGrpcV2Beta1 dialogflow;
  String message = '';

  @override
  void initState() {
    initializeChatPage();
    super.initState();
  }

  void initializeChatPage() async {
    user = FirebaseAuth.instance.currentUser;
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/credentials.json'))}');
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacementNamed(context, LoginScreen.id);
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10.0,
              ),
              child: Container(
                //decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextField(
                      controller: controller,
                      decoration: kMessageTextFieldDecoration,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        message = value;
                      },
                    )),
                    CircularButton(
                      color: Colors.blueAccent,
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        if (message != '') {
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
                            final data =
                                await dialogflow.detectIntent(message, 'en-US');
                            String fulfillmentText =
                                data.queryResult.fulfillmentText;
                            if (fulfillmentText.isNotEmpty) {
                              _fireStore
                                  .collection('messages')
                                  .doc(user.uid)
                                  .collection('usrMsgs')
                                  .add({
                                'text': fulfillmentText,
                                'self': false,
                                'time': FieldValue.serverTimestamp(),
                              });
                            }
                          } catch (e) {
                            print('Exception: $e');
                          }
                        }
                        message = '';
                      },
                    ),
                  ],
                ),
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

  String getTimeStampDate(Timestamp ts) {
    String date = '';
    DateTime dt = ts.toDate();
    DateTime today = DateTime.now();
    if (dt.day == today.day)
      date = 'Today';
    else if (today.difference(dt).inDays <= 1)
      date = 'Yesterday';
    else if (today.difference(dt).inDays < 7)
      date = weekDayName(dt.weekday, fullname: true);
    else
      date = '${dt.year} ${monthName(dt.month)} ${dt.day}, ${weekDayName(
        dt.weekday,
        fullname: true,
      )}';

    return date;
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
            List<Widget> messageWidgets = [];
            List<Map<String, dynamic>> msgList = [];
            int listLength = 0;
            for (var msg in snapshot.data.docs.reversed) {
              final txt = msg.get('text');
              final isMe = msg.get('self');
              final Timestamp time = msg.get('time');
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
                if (last['time'] != null &&
                    time.toDate().day != last['time'].toDate().day)
                  messageWidgets
                      .add(DateDisplay(date: getTimeStampDate(last['time'])));
              }
            }
            if (listLength > 0) {
              messageWidgets.add(getMsgBubble(msgList[listLength - 1], false));
              messageWidgets.add(DateDisplay(
                  date: getTimeStampDate(
                msgList[listLength - 1]['time'],
              )));
            }
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
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
