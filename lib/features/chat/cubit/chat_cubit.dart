import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/services/http_services.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial()) {
    getMesages();
  }

  Future<void> getMesages() async {
    emit(ChatLoading());
    try {
      final response = await HttpServices.getMessages();
      if (response["id"] != "") {
        emit(ChatSuccess(""));
      } else {
        emit(ChatFailure(""));
      }
    } catch (e) {
      log(e.toString());
      emit(ChatFailure(""));
    }
  }

  void startLoading() {
    emit(ChatLoading());
  }

  void emitSuccess(String message) {
    emit(ChatSuccess(message));
  }

  void emitFailure(String message) {
    emit(ChatFailure(message));
  }
}
