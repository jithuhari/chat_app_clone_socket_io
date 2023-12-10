import 'package:flutter/material.dart';

import '../../model/chat_model/chat_model.dart';
import '../tabbar_screens/camera_screen/camera_screen.dart';
import '../tabbar_screens/chat_screen/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.chatModels, required this.sourceChat});
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(onSelected: (value) {
            debugPrint(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: 'New group',
                child: Text(
                  'New group',
                ),
              ),
              PopupMenuItem(
                value: 'New broadcast',
                child: Text(
                  'New broadcast',
                ),
              ),
              PopupMenuItem(
                value: 'Whatsapp web',
                child: Text(
                  'Whatsapp web',
                ),
              ),
              PopupMenuItem(
                value: 'Starred message',
                child: Text(
                  'Starred message',
                ),
              ),
              PopupMenuItem(
                value: 'Settings',
                child: Text(
                  'Settings',
                ),
              ),
            ];
          })
        ],
        bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ]),
      ),
      body: TabBarView(controller: _controller, children: [
        const CameraScreen(),
        ChatScreen(
          chatModels: widget.chatModels,
          sourceChat: widget.sourceChat,
        ),
        const Text('Status'),
        const Text('Calls')
      ]),
    );
  }
}
