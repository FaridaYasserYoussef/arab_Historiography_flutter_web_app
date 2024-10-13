
import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/Screens/AISearchScreen.dart';
import 'package:trial_flutter_web_app/Screens/allBooksSearchScreen.dart';
import 'package:trial_flutter_web_app/Screens/singleBookSearchScreen.dart';
import 'package:trial_flutter_web_app/Screens/timeSearchScreen.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:trial_flutter_web_app/reusableWidgets/searchOptionButtonWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> optionNames = [
    "بحث قي كتاب محدد",
    "بحث في كل الكتب",
    "بحث بالذكاء الاصطناعي",
    "بحث زمني"
  ];


  List<String> imagePaths = [
    "assets/images/single_book_search.png",
    "assets/images/all_books_search.png",
    "assets/images/ai_search.png",
    "assets/images/time_search.png"
  ];

  List<String> routeNames = [
    SingleBookSearchScreen.routeName,
    AllBooksSearchScreen.routeName,
    AISearchScreen.routeName,
    TimeSearchScreen.routeName
  ];



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF26211C),
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        
        
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.24, 
                  top: MediaQuery.of(context).size.height * 0.08,
                  bottom: MediaQuery.of(context).size.height * 0.06
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "إبحث في أكثر من 2000 كتاب باللغة العربية",
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 500),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ),
        
        
        
            Center(child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40)
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // const TypewriterText(text: "إستكشف أكثر من 2000 كتاب تاريخ عربي"),
                      
                    Image(image: const AssetImage("assets/images/homtest.png"), width: MediaQuery.of(context).size.width *0.53,),
                   
                      
                    
                  ],
                ),
              ))),
            
        
         Padding(
         padding:  EdgeInsets.only(right:  MediaQuery.of(context).size.width *0.10, bottom:  MediaQuery.of(context).size.height *0.05),
         child: Text("اختيارات البحث:", textDirection: TextDirection.rtl,
                       style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900
                       ),),
         ),
        
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.24),
              child: Center(
                child: Row(children: [
                  SearchOptionButtonWidget(imagePath: imagePaths[0], routeName: routeNames[0], buttonText: optionNames[0]),
                                    SearchOptionButtonWidget(imagePath: imagePaths[1], routeName: routeNames[1], buttonText: optionNames[1]),
                                     SearchOptionButtonWidget(imagePath: imagePaths[2], routeName: routeNames[2], buttonText: optionNames[2]),
                                    SearchOptionButtonWidget(imagePath: imagePaths[3], routeName: routeNames[3], buttonText: optionNames[3])
              
              
                ],),
              )
            ),

  Padding(
         padding:  EdgeInsets.only(right:  MediaQuery.of(context).size.width *0.10, bottom:  MediaQuery.of(context).size.height *0.05),
         child: const Text("ابرز الكتب", textDirection: TextDirection.rtl,
                       style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900
                       ),),
         ),
        
        Container(
        child: CarouselSlider(items: 
        [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
        children: [
          Expanded(child: Image(image: AssetImage("assets/images/image75.png") )),
          SizedBox(width: 10,),
          Expanded(
            child: Text('''هذا نص تجريبي يتم استخدامه   
            لتعبئة النصوص في المشاريع، الهدف منه هو إظهار
             التنسيق والشكل العام للمحتوى دون
              التركيز على المعنى. هذا النص لا يحتوي على أي معنى
              حقيقي ولكنه يستخدم في التصميم والطباعة لتجربة
              الخطوط وتوزيع النصوص على الصفحة.
               يمكنك تعديل النص أو إضافة المزيد منه 
               حسب الحاجة في المشروع الخاص بك.
            ''', style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900
                           )
            ,
                    textAlign: TextAlign.center,
            
            ),
          )
        ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
        
            child: Row(
        children: [
          Expanded(child: Image(image: AssetImage("assets/images/image87.png"),)),
                  SizedBox(width: 10,),
          
            Expanded(
              child: Text('''هذا نص تجريبي يتم استخدامه كعنصر  
                      لتعبئة النصوص في المشاريع، الهدف منه هو إظهار
                       التنسيق والشكل العام للمحتوى دون
              التركيز على المعنى. هذا النص لا يحتوي على أي معنى
              حقيقي ولكنه يستخدم في التصميم والطباعة لتجربة
              الخطوط وتوزيع النصوص على الصفحة.
               يمكنك تعديل النص أو إضافة المزيد منه 
               حسب الحاجة في المشروع الخاص بك.
                      ''', style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900
                           )
                      ,
                    textAlign: TextAlign.center,
                      
                      ),
            )
        ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
        
            child: Row(
        children: [
          Expanded(child: Image(image: AssetImage("assets/images/image155.png"),)),
                  SizedBox(width: 10,),
          
          Expanded(
            child: Text('''هذا نص تجريبي يتم استخدامه كعنصر  
            لتعبئة النصوص في المشاريع، الهدف منه هو إظهار
             التنسيق والشكل العام للمحتوى دون
              التركيز على المعنى. هذا النص لا يحتوي على أي معنى
              حقيقي ولكنه يستخدم في التصميم والطباعة لتجربة
              الخطوط وتوزيع النصوص على الصفحة.
               يمكنك تعديل النص أو إضافة المزيد منه 
               حسب الحاجة في المشروع الخاص بك.
            ''', style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900
                           )
            ,
            textAlign: TextAlign.center,
            ),
          )
        ],
            ),
          ),
        ]
        , options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 2),
          height: 300
        )),
        ),


          ],
        ),
      ),
    );
  }
}
