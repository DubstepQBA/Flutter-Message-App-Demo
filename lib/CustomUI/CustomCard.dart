import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbachat/Model/ChatModel.dart';
import 'package:qbachat/Screen/individualPage.dart';

class CustomCard extends StatelessWidget {

 const  CustomCard({Key? key,required this.chatModel}) : super(key: key);
   final ChatModel chatModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(chatModel:chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                  chatModel.isGroup? "assets/groups.svg": "assets/person.svg",
                  color: Colors.white60,
                  height: 38,
                  width: 38),
              backgroundColor: Colors.indigoAccent,

            ),
            title:Text(chatModel.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all_sharp),
                SizedBox(width: 3,),
                Text(chatModel.currentMsg,style: TextStyle(fontSize: 13),)
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 60),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
