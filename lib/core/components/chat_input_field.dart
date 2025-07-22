import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Type a message',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                // handle send
              },
            ),
          )
        ],
      ),
    );
  }
}
