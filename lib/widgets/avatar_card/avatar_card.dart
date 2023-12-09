import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatts_app/model/chat_model/chat_model.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.blueGrey[200],
                child: SvgPicture.asset('assets/person.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    height: 30,
                    width: 30),
              ),

              // contactModel.select?
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 13,
                    )),
              )
              // :Container()
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
