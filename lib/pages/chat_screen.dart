import 'package:chatapp/chat/chat_services.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatScreen({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    // only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(
        widget.receiverUserID,
        _messageController.text,
      );

      // clear the text controller after sending the message

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.receiverUserEmail,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // message
          Expanded(child: _buildMessageList()),
          // user input
          _buildMessageInput(),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatServices.getMessages(
        widget.receiverUserID,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading....');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //build message item

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // align the message to the right if the sender is the current user, otherwise to the left

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        children: [Text(data['senderEmail']), Text(data['message'])],
      ),
    );
  }

  // build message input

  Widget _buildMessageInput() {
    return Row(
      children: [
        // textField
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Enter message",
            obscureText: false,
          ),
        ),

        // send button
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.arrow_upward, size: 40),
        ),
      ],
    );
  }
}
