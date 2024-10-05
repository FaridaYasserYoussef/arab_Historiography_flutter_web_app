import 'package:flutter/material.dart';

class TempHeader extends StatelessWidget {
  const TempHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *0.06, horizontal: MediaQuery.of(context).size.width *0.07),
      child: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
          actions: [
            Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.008),
            child: CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black,)), backgroundColor: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.008),
            child: CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.black,)), backgroundColor: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.008),
            child: CircleAvatar(child: IconButton(onPressed: (){}, icon: Icon(Icons.home, color: Colors.black,)), backgroundColor: Colors.white,),
          )
          ],
          toolbarHeight: MediaQuery.of(context).size.height *0.12,
          backgroundColor: Color.fromARGB(255, 110, 172, 218),
          leading: Padding(
            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.008),
            child: ImageIcon( AssetImage("assets/logo.png"), color: Colors.white, size: MediaQuery.of(context).size.height *0.18,),
          ),
          title: Text("Arabic Historiography", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
    );
  }
}