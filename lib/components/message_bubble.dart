import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({
    this.text,
    this.isMe,
    this.hideSender = false,
    this.time,
  });

  final String text;
  //final String sender;
  final bool isMe;
  final bool hideSender;
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMe ? 30.0 : 10.0,
        hideSender ? 2.5 : 10.0,
        isMe ? 10.0 : 30.0,
        hideSender ? 2.5 : 10.0,
      ),
      child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            /*Visibility(
              visible: !hideSender,
              child: Text(
                sender,
                style: TextStyle(color: Colors.black54, fontSize: 12.0),
              ),
            ),*/
            Material(
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topRight: hideSender
                            ? Radius.circular(30.0)
                            : Radius.circular(0.0),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topLeft: hideSender
                            ? Radius.circular(30.0)
                            : Radius.circular(0.0),
                      ),
                elevation: 3.0,
                color: isMe ? Colors.lightBlue : Colors.white,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: isMe ? Colors.white : Color(0xAF000000),
                          fontSize: 15.0),
                    ))),
          ]),
    );
  }
}
