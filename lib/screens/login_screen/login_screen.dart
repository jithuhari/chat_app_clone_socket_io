import 'package:flutter/material.dart';
import 'package:whatts_app/screens/home_screen/home_screen.dart';
import 'package:whatts_app/widgets/button_card/button_card.dart';

import '../../model/chat_model/chat_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
        time: '4.00',
        icon: 'person.svg',
        currentMessage: 'Hi manhhh',
        isGroup: false,
        name: 'Manu',
        id: 1),
    ChatModel(
        time: '6.00',
        icon: 'person.svg',
        currentMessage: 'Hi how are you',
        isGroup: false,
        name: 'Subin',
        id: 2),
    ChatModel(
        time: '8.00',
        icon: 'person.svg',
        currentMessage: 'heyyyy',
        isGroup: false,
        name: 'Ajmal',
        id: 3),
    ChatModel(
        time: '9:20',
        icon: 'person.svg',
        currentMessage: 'Awsome',
        isGroup: false,
        name: 'Rayan',
        id: 4)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatModels.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourceChat = chatModels.removeAt(index);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => HomeScreen(
                            chatModels: chatModels,
                            sourceChat: sourceChat!,
                          )),
                );
              },
              child:
                  ButtonCard(name: chatModels[index].name, icon: Icons.person))),
    );
  }
}
