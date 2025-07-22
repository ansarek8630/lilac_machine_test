import 'package:flutter/material.dart';
import 'package:lilac_machine_test/core/constands/colors.dart';
import '../../../core/components/chat_input_field.dart';
import '../../../core/components/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                children: [
                  BackButton(),
                  Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    color: Colors.transparent,
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://www.kerala9.com/wp-content/gallery/nayantara/nayanthara-beautiful-images-003.jpeg'),
                                    ),
                                  ),
                                ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                      child:
                          Text("today", style: TextStyle(color: Colors.grey,fontSize: 8))),
                  SizedBox(height: 20),
                  MessageBubble(
                    message: "Hi",
                    time: "9:40 AM",
                    isSender: true,
                  ),
                ],
              ),
            ),
            ChatInputField(),
          ],
        ),
    );
  }
}
