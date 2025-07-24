import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac_machine_test/data/models/get_messages.dart';
import '../../../data/services/http_services.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial()) {
    getMesages();
  }

  Future<void> getMesages() async {
    emit(ChatLoading());
    try {
      final GetMessages response = await HttpServices.getMessages();
        emit(ChatSuccess(response));
    } catch (e) {
      log(e.toString());
      emit(ChatFailure(""));
    }
  }
}
