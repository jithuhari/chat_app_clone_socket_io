class ChatModel {
  String name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool select = false;
  ChatModel(
      {this.time,
      this.icon,
      this.currentMessage,
      this.isGroup,
      required this.name,
      this.status,
      this.select = false});
}
