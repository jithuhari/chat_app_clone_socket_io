import 'package:flutter/material.dart';
import 'package:whatts_app/model/chat_model/chat_model.dart';
import 'package:whatts_app/screens/select_contact/select_contact_screen.dart';
import 'package:whatts_app/widgets/custom_card/custom_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chats = [
    ChatModel(
        time: '4.00',
        icon: 'person.svg',
        currentMessage: 'Hi manhhh',
        isGroup: false,
        name: 'Manu'),
    ChatModel(
        time: '10.00',
        icon: 'groups.svg',
        currentMessage: 'Hi all',
        isGroup: true,
        name: 'School group'),
    ChatModel(
        time: '6.00',
        icon: 'person.svg',
        currentMessage: 'Hi how are you',
        isGroup: false,
        name: 'Subin'),
    ChatModel(
        time: '8.00',
        icon: 'person.svg',
        currentMessage: 'heyyyy',
        isGroup: false,
        name: 'Ajmal')
  ];
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
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return CustomCard(
                chatModel: chats[index],
              );
            }));
  }
}
