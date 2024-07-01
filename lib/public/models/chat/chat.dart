class ChatModel {
  String name;
  String icon;
  bool? isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  ChatModel({
    required this.name,
    required this.icon,
    this.isGroup = false,
    required this.time,
    required this.currentMessage,
    required this.status,
    this.select = false,
    required this.id,
  });
}