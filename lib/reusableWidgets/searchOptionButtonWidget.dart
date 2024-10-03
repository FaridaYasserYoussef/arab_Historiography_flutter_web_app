import 'package:flutter/material.dart';

class SearchOptionButtonWidget
 extends StatelessWidget {
String imagePath;
String routeName;
String buttonText;

SearchOptionButtonWidget({
  required this.imagePath,
  required this.routeName,
  required this.buttonText
});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.02),
      child: Column(
        children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey)]
          ),
          child: Image(image: AssetImage(imagePath), width: MediaQuery.of(context).size.width *0.13,)),
        SizedBox(height: 4,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            fixedSize: Size(MediaQuery.of(context).size.width *0.13, MediaQuery.of(context).size.height *0.05)
          
          ),
          onPressed: (){
          Navigator.of(context).pushNamed(routeName);
        }, child: Text(buttonText)),

        SizedBox(height: 100,)
      ],),
    );
  }
}