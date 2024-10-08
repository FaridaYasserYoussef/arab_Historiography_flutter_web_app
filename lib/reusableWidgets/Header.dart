import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{

String? title;
  @override
  Size get preferredSize => Size.fromHeight(110); // Adjust height as needed
  
Header({
  this.title
});
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leadingWidth: 90,
      toolbarHeight: 100,
      centerTitle: true,
      title: Text(title ?? '',
      style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
      ),
      backgroundColor: Color(0XFF26211C),
      leading: 
      ImageIcon(
        AssetImage("assets/images/logo.png",
         
        ),
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.25,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white),
            ),
            backgroundColor: Color(0XFF383029),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.white),
            ),
            backgroundColor: Color(0XFF383029),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CircleAvatar(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home, color: Colors.white),
            ),
            backgroundColor: Color(0XFF383029),
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(2), // Thickness of the bottom border
        child: Container(
          color: Colors.white, // Set your desired color here
          height: 2, // Set the height of the bottom border
        ),
      ),
    );
  }
}
