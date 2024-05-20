class ChatDataModel {
  List<ChatSocket>? chats;
  ChatDataModel({this.chats});
}

class ChatSocket {
  final String? receiverId;
  final String? senderId;
  final String? message;
  final int? createdAt;
  ChatSocket({this.createdAt, this.message, this.receiverId, this.senderId});
}
