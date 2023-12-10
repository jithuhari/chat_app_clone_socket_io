import 'package:flutter/material.dart';
import 'package:whatts_app/screens/select_contact/select_contact_screen.dart';

import '../../../model/chat_model/chat_model.dart';
import '../../../widgets/custom_card/custom_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key, required this.chatModels, required this.sourceChat});

  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.chat),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => const SelectContactScreen()));
          }),
      body: ListView.builder(
          itemCount: widget.chatModels.length,
          itemBuilder: (context, index) {
            return CustomCard(
              chatModel: widget.chatModels[index],
              sourceChat: widget.sourceChat,
            );
          }),
    );
  }
}
