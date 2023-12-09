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
        child: const Card(
          color: Color(0xFFdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 20),
                child: Text('hai how are you ? This is a test message....'),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [Text('12:30'), Icon(Icons.done_all)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
