import 'package:flutter/material.dart';
import 'package:qbachat/page/ChatPage.dart';
import 'package:qbachat/page/CitaPague.dart';
import 'package:qbachat/page/EstadoPage.dart';
import 'package:qbachat/page/LlamadaPage.dart';

class Homescreen extends StatefulWidget {
   Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController= TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    //Barra de cabeseras
      appBar: AppBar(
        title: Text('QbaChat'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
            itemBuilder:(BuildContext contesxt){
            return [
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.heart_broken_sharp,color: Colors.indigoAccent,),
                      Text(' Crear Cita'),
                    ],
                  ),value: "Crear Citas",),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.group,color: Colors.indigoAccent,),
                      Text(' Nuevo Grupo'),
                    ],
                  ),value: " Nuevo Grupo"),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.person,color: Colors.indigoAccent,),
                      Text(' Perfil'),
                    ],
                  ),value: "Perfil",),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.settings,color: Colors.indigoAccent,),
                      Text(' Ajustes'),
                    ],
                  ),value: " Ajustes",),
            ];
          },
          )
        ],
        bottom: TabBar(

          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab( icon: Icon(Icons.heart_broken_rounded),),
            Tab(text: 'Chat' ),
            Tab(text: 'Estados'),
            Tab(text: 'Llamadas')
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CitaPage(),
          ChatPage(),
          EstadoPage(),
          LlamadaPage()
        ],
      ),
    );
  }
}
