// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/features/chat/cubit/chat_cubit.dart';

import '../cubit/chat_state.dart';

class Messages extends StatelessWidget {
  Messages({super.key});
  List image = [
    'https://www.kerala9.com/wp-content/gallery/nayantara/nayanthara-beautiful-images-003.jpeg',
    'https://e1.pxfuel.com/desktop-wallpaper/423/925/desktop-wallpaper-kerala-girls-malayalam-girls.jpg',
    'https://p0.pxfuel.com/preview/621/868/1023/fashion-style-hair-t-shirt-royalty-free-thumbnail.jpg',
    'https://www.breezemasti.com/wp-content/uploads/Leona-Lishoy-malayalam-actress-images-2.jpg',
    'https://i0.wp.com/pixahive.com/wp-content/uploads/2020/12/Smart-boy-243728-pixahive.jpg',
    'https://stylesatlife.com/wp-content/uploads/2021/03/latest-Malayalam-Actress-Anarkali-Marikar.jpg',
    'https://www.kerala9.com/wp-content/gallery/nayantara/nayanthara-beautiful-images-003.jpeg',
    'https://e1.pxfuel.com/desktop-wallpaper/423/925/desktop-wallpaper-kerala-girls-malayalam-girls.jpg',
    'https://p0.pxfuel.com/preview/621/868/1023/fashion-style-hair-t-shirt-royalty-free-thumbnail.jpg',
    'https://www.breezemasti.com/wp-content/uploads/Leona-Lishoy-malayalam-actress-images-2.jpg',
    'https://i0.wp.com/pixahive.com/wp-content/uploads/2020/12/Smart-boy-243728-pixahive.jpg',
    'https://stylesatlife.com/wp-content/uploads/2021/03/latest-Malayalam-Actress-Anarkali-Marikar.jpg'
  ];

  List names = [
    'Thara Vishwanath',
    'Supriya K',
    'Robert Mathew',
    'Christena',
    'Sam Alex',
    'Meenakshi',
    'Thara Vishwanath',
    'Supriya K',
    'Robert Mathew',
    'Christena',
    'Sam Alex',
    'Meenakshi',
  ];

  List messageTime = [
    '23 min',
    '35 min',
    '40 min',
    '50 min',
    '50 min',
    '55 min',
    '23 min',
    '35 min',
    '40 min',
    '50 min',
    '50 min',
    '55 min'
  ];

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
            body: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
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
                                  itemCount: 10,
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
                                              image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://www.kerala9.com/wp-content/gallery/nayantara/nayanthara-beautiful-images-003.jpeg'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text("Ansar")
                                      ],
                                    );
                                  },
                                ),
                              ),
                              TextField(
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
                              const Text("Chats",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  )),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: image.length,
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/chats');
                                    },
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
                                                      color: Colors.transparent,
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            image[i]),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(names[i],
                                                        style: const TextStyle(
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
                                                Text(messageTime[i],
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
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const CircularProgressIndicator();
            }),
          );
        },
      ),
    );
  }
}
