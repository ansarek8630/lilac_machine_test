// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/features/chat/cubit/chat_cubit.dart';
import 'package:lilac_machine_test/features/chat/views/chats.dart';
import '../../../data/models/get_messages.dart';
import '../cubit/chat_state.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<UserList> messagers = [];

  List<UserList> filteredMessagers = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ChatCubit()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: BlocListener<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagers = state.response.data;
                  filteredMessagers = state.response.data;
                }
              },
              child:
                  BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
                return state is ChatSuccess
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    BackButton(),
                                    Text("Messages",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .12,
                                  child: ListView.builder(
                                    itemCount: messagers.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                color: Colors.transparent,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(messagers[
                                                          index]
                                                      .attributes
                                                      .square100ProfilePhotoUrl),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(messagers[index].attributes.name)
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                TextField(
                                  onChanged: (value) {
                                    filteredMessagers = messagers
                                        .where((item) => item.attributes.name
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                        .toList();
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(98),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13.0, bottom: 13.0, right: 20),
                                      child: Image.asset(
                                        'assets/images/search.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    final cubit = context.read<ChatCubit>();
                                    cubit.getMesages();
                                  },
                                  child: const Text("Chats",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: filteredMessagers.length,
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(name: filteredMessagers[
                                                                      i]
                                                                  .attributes
                                                                  .name, proPic: filteredMessagers[
                                                                      i]
                                                                  .attributes
                                                                  .profilePhotoUrl),));
                                      },
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 61,
                                                      width: 61,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.transparent,
                                                      ),
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              width: 2),
                                                          color:
                                                              Colors.transparent,
                                                          image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                filteredMessagers[
                                                                        i]
                                                                    .attributes
                                                                    .profilePhotoUrl),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            filteredMessagers[i]
                                                                .attributes
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                            )),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                        filteredMessagers[i]
                                                            .attributes
                                                            .messageReceivedFromPartnerAt
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors
                                                                .grey.shade400)),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                            onTap: () {
                              final cubit = context.read<ChatCubit>();
                              cubit.getMesages();
                            },
                            child: const CircularProgressIndicator()),
                      );
              }),
            ),
          );
        },
      ),
    );
  }
}
