import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: const Color(0xFFdcf8c6),
          child: Stack(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  'hai how are you ? This is a test message.........',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      '12:30',
                      style:
                          TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                    const SizedBox(width: 5,),
                    const Icon(Icons.done_all,size: 20,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
