class ChatMessageModel {
  final String? message;
  final String date;
  final String time;
  final String sender;
  final String receiver;
  final String messageId;

  ChatMessageModel(
    this.message,
    this.date,
    this.time,
    this.sender,
    this.receiver,
    this.messageId,
  );

  Map<String, dynamic> toMap() => {
    'message': message,
    'date': date,
    'time': time,
    'sender': sender,
    'receiver': receiver,
    'messageId': messageId,
  };
  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      map['message'],
      map['date'],
      map['time'],
      map['sender'],
      map['receiver'],
      map['messageId'],
    );
  }
}
