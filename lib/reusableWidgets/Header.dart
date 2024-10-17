import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/Screens/HomePage.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{

String? title;
  @override
  Size get preferredSize => const Size.fromHeight(110); // Adjust height as needed
  
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
      style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
      ),
      backgroundColor: Color(0XFF26211C),
      leading: 
      ImageIcon(
        const AssetImage("assets/images/logo.png",
         
        ),
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.25,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CircleAvatar(
            backgroundColor: Color(0XFF383029),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CircleAvatar(
            backgroundColor: const Color(0XFF383029),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.008),
          child: CircleAvatar(
            backgroundColor: const Color(0XFF383029),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
              icon: const Icon(Icons.home, color: Colors.white),
            ),
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2), // Thickness of the bottom border
        child: Container(
          color: Colors.white, // Set your desired color here
          height: 2, // Set the height of the bottom border
        ),
      ),
    );
  }
}
