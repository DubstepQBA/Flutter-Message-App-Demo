import 'package:flutter/material.dart';
import 'package:qbachat/CustomUI/CustomCard.dart';

import '../Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chat=[
    ChatModel(name: "Javier", icon:"person.svg", isGroup: false, time: '4:00', currentMsg: "Hi this the message"),
    ChatModel(name: "Taimarys", icon:"person.svg", isGroup: false, time: '4:00', currentMsg: "Hi this the message"),
    ChatModel(name: "User1", icon:"person.svg", isGroup: false, time: '4:00', currentMsg: "Hi this the message"),
    ChatModel(name: "User2", icon:"person.svg", isGroup: false, time: '4:00', currentMsg: "Hi this the message"),
    ChatModel(name: "Grupos", icon:"groups.svg", isGroup: true, time: '4:00', currentMsg: "Hi this the message"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.chat_sharp),
      ),
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chat[index],),
      ),

    );
  }
}
