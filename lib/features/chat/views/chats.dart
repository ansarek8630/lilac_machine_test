// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constands/colors.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.name, required this.proPic});

  String name;
  String proPic;

  final List<Message> messages = [
    Message(text: "Hi", isMe: true, time: "2:45 PM"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const BackButton(),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      proPic,
                    ),
                  ),
                  const SizedBox(width: 10),
                   Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Chat Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  return Align(
                    alignment: message.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: message.isMe
                                ? AppColors.primaryColor
                                : Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft:
                                  Radius.circular(message.isMe ? 16 : 0),
                              bottomRight:
                                  Radius.circular(message.isMe ? 0 : 16),
                            ),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color:
                                  message.isMe ? Colors.white : Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          message.time,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Message Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.send, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  final String time;

  Message({required this.text, required this.isMe, required this.time});
}
