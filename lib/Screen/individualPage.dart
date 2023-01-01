import 'package:flutter/material.dart';
import 'package:qbachat/Model/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class IndividualPage extends StatefulWidget {
   IndividualPage({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {

  bool show = false;
  FocusNode  focusNode =FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        titleSpacing: 3,
        leadingWidth: 70,
        leading:InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back,size: 24,),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup ?"assets/groups.svg":"assets/person.svg",
                        color: Colors.white60,
                        height: 36,
                        width: 36),
                    radius:20,
                    backgroundColor: Colors.indigoAccent,
                  ),
                  ],
              ),
            ],
          ),
        ),title: InkWell(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatModel.name,style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Icon(Icons.circle,color: Colors.green,size: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text("Linea",style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal),),
                      ),
                    ],
                  )
                ],
      ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken_sharp)),
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
            itemBuilder:(BuildContext contesxt){
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.block,color: Colors.indigoAccent,),
                      Text(' Bloquear'),
                    ],
                  ),value: " Bloquear",),
                PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.cancel,color: Colors.indigoAccent,),
                        Text(' Cancelar Cita'),
                      ],
                    ),value: " Cancelar Cita"),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.person,color: Colors.indigoAccent,),
                      Text(' Perfil'),
                    ],
                  ),value: "Perfil",)
              ];
            },
          )
             ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                          width:MediaQuery.of(context).size.width-60,
                          child: Card(
                              margin: EdgeInsets.only(left: 2 ,right:2 ,bottom: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              child:TextFormField(
                                focusNode:focusNode ,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.text,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mensaje",
                                  prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions,color: Colors.indigoAccent),
                                      onPressed: (){
                                        setState(() {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus=false;
                                          show=!show;
                                        });
                                      }),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //Bottones de Camara y Ajuntar Files
                                      IconButton(onPressed: (){}, icon: Icon(Icons.attach_file)),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(5),

                                ),
                              ))),
                      Padding(
                        //Botton de Grabar Audio
                        padding: const EdgeInsets.only(bottom: 8,right: 5,left: 2),
                        child: CircleAvatar(
                          radius: 25,
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.mic)),
                        ),
                      )
                    ],
                  ),

                 show ? emojiPicker():Container(),
                ],
                 ),
            )
          ],
        ),
      ),
    );
  }
 Widget emojiPicker(){
    return EmojiPicker(
      onEmojiSelected: (category, emoji) => {
                print(emoji)
      },
    );
 }
}
