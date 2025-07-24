import '../../../data/models/get_messages.dart';

class ChatState {
  ChatState();
}

class ChatInitial extends ChatState {
}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final GetMessages response;
  ChatSuccess(this.response);
}

class ChatFailure extends ChatState {
  final String message;
  ChatFailure(this.message);
}                     
