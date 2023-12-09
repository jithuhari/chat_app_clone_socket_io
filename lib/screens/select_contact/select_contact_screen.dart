import 'package:flutter/material.dart';
import 'package:whatts_app/screens/create_group/create_group_screen.dart';
import 'package:whatts_app/widgets/button_card/button_card.dart';

import '../../model/chat_model/chat_model.dart';
import '../../widgets/contact_card/contact_card.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({super.key});

  @override
  State<SelectContactScreen> createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  List<ChatModel> contactsList = [
    ChatModel(
      name: 'Aju',
      status: 'A flutter Developer',
    ),
    ChatModel(
      name: 'Manu',
      status: 'Busy!!!',
    ),
    ChatModel(
      name: 'Ajmal',
      status: 'Traveling......',
    ),
    ChatModel(
      name: 'Sam',
      status: 'Always Happy☺️☺️☺️',
    ),
    ChatModel(
      name: 'Rayan',
      status: 'Hiii all',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contacts',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '220 contacts',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton(onSelected: (value) {
            debugPrint(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: 'Invite a friend',
                child: Text(
                  'Invite a friend',
                ),
              ),
              PopupMenuItem(
                value: 'Contacts',
                child: Text(
                  'Contacts',
                ),
              ),
              PopupMenuItem(
                value: 'Refresh',
                child: Text(
                  'Refresh',
                ),
              ),
              PopupMenuItem(
                value: 'Help',
                child: Text(
                  'Help',
                ),
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: contactsList.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const CreateGroupScreen()));
                  },
                  child:
                      const ButtonCard(name: 'New Group', icon: Icons.group));
            } else if (index == 1) {
              return const ButtonCard(
                  name: 'New Contact', icon: Icons.person_add);
            }
            return ContactCard(
              contactModel: contactsList[index - 2],
            );
          }),
    );
  }
}
