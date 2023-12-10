import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatts_app/model/chat_model/chat_model.dart';
import 'package:whatts_app/widgets/own_message_card/own_message_card.dart';
import 'package:whatts_app/widgets/reply_card/reply_card.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:flutter/foundation.dart' as foundation;

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {super.key, required this.chatModel, required this.sourceChat});

  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool isEmojiShow = false;
  FocusNode focusNode = FocusNode();
  IO.Socket? socket;
  bool sendButton = false;

  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isEmojiShow = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.1.85:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.emit("signin", widget.sourceChat.id);
    socket!.onConnect(
      (data) => debugPrint("Connected"),
    );
    print(socket!.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    socket!.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/whatsappbackground.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              PopupMenuButton(onSelected: (value) {
                debugPrint(value);
              }, itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: 'View Contact',
                    child: Text(
                      'View Contact',
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Media, links and docs',
                    child: Text(
                      'Media, links and docs',
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Whatsapp web',
                    child: Text(
                      'Whatsapp web',
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Search',
                    child: Text(
                      'Search',
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Mute Norificaion',
                    child: Text(
                      'Mute Norificaion',
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Wallpaper',
                    child: Text(
                      'Wallpaper',
                    ),
                  ),
                ];
              })
            ],
            titleSpacing: 0,
            leadingWidth: 70,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup!
                          ? 'assets/groups.svg'
                          : 'assets/person.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      height: 37,
                      width: 37,
                    ),
                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: const TextStyle(
                          fontSize: 18.5, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Last Seen Today At ${widget.chatModel.time}',
                      style: const TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                if (isEmojiShow) {
                  setState(() {
                    isEmojiShow = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 180,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                margin: const EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        sendButton = true;
                                      });
                                    } else {
                                      setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                  controller: textController,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type a message',
                                      contentPadding: const EdgeInsets.all(5),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) {
                                                      return bottomSheet();
                                                    });
                                              },
                                              icon: const Icon(
                                                  Icons.attach_file)),
                                          IconButton(
                                              onPressed: () {},
                                              icon:
                                                  const Icon(Icons.camera_alt))
                                        ],
                                      ),
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            setState(() {
                                              isEmojiShow = !isEmojiShow;
                                            });
                                          },
                                          icon: const Icon(
                                              Icons.emoji_emotions))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 5, bottom: 8),
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {
                                      if (sendButton) {
                                        sendMessage(
                                          textController.text,
                                          widget.sourceChat.id!,
                                          widget.chatModel.id!,
                                        );
                                        textController.clear();
                                      }
                                    },
                                    icon: sendButton == false
                                        ? const Icon(
                                            Icons.mic,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height: isEmojiShow == false
                                ? 0
                                : MediaQuery.of(context).size.height / 2.5,
                            child: emojiSelect())
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  iconCreation(Icons.person, Colors.blue, "Contact")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: const Config(
        columns: 8,
        // emojiSizeMax: 32 *
        //     (foundation.defaultTargetPlatform == TargetPlatform.android
        //         ? 1.30
        //         : 1.0),
        // verticalSpacing: 0,
        // horizontalSpacing: 0,
        // gridPadding: EdgeInsets.zero,
        // initCategory: Category.RECENT,
        // bgColor: const Color(0xFFF2F2F2),
        // indicatorColor: Colors.blue,
        // iconColor: Colors.grey,
        // iconColorSelected: Colors.blue,
        // backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        // recentTabBehavior: RecentTabBehavior.RECENT,
        // recentsLimit: 28,
        // noRecents: const Text(
        //   'No Recents',
        //   style: TextStyle(fontSize: 20, color: Colors.black26),
        //   textAlign: TextAlign.center,
        // ), // Needs to be const Widget
        // loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
        // tabIndicatorAnimDuration: kTabScrollDuration,
        // categoryIcons: const CategoryIcons(),
        // buttonMode: ButtonMode.MATERIAL,
      ),
      onEmojiSelected: (emoji, category) {
        debugPrint(emoji.toString());
        setState(() {
          textController.text = textController.text + category.emoji;
        });
      },
    );
  }
}
