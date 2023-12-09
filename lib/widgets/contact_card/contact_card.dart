import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatts_app/model/chat_model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contactModel});

  final ChatModel contactModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
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
            contactModel.select? const Positioned(
              bottom: 4,
              right: 5,
              child:  CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  )),
            ):Container()
          ],
        ),
      ),
      title: Text(
        contactModel.name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contactModel.status!,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
