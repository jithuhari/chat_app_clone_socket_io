import 'package:flutter/material.dart';
import 'package:whatts_app/widgets/avatar_card/avatar_card.dart';

import '../../model/chat_model/chat_model.dart';
import '../../widgets/contact_card/contact_card.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  List<ChatModel> contactsList = [
    ChatModel(name: 'Aju', status: 'A flutter Developer'),
    ChatModel(name: 'Manu', status: 'Busy!!!'),
    ChatModel(name: 'Ajmal', status: 'Traveling......'),
    ChatModel(name: 'Sam', status: 'Always Happy☺️☺️☺️'),
    ChatModel(name: 'Rayan', status: 'Hiii all')
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add Participants',
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contactsList.length+1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.isNotEmpty ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contactsList[index-1].select == false) {
                      setState(() {
                        contactsList[index-1].select = true;
                        groups.add(contactsList[index-1]);
                      });
                    } else {
                      setState(() {
                        contactsList[index-1].select = false;
                        groups.remove(contactsList[index-1]);
                      });
                    }
                  },
                  child: ContactCard(
                    contactModel: contactsList[index-1],
                  ),
                );
              }),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          itemCount: contactsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (contactsList[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contactsList[index]);
                                    contactsList[index].select = false;
                                  });
                                },
                                child: AvatarCard(
                                  contact: contactsList[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
