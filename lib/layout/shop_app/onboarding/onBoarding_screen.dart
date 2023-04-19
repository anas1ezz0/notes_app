// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names
import 'package:app/layout/shop_app/shop_login/shop_login_screen.dart';
import 'package:app/shared/components/components.dart';
import 'package:app/shared/network/remote/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared/styles/colors.dart';
 
class BoardingModle{
  final String title;
  final String image;
 final String  body;

BoardingModle({
  required this.title,
   required this.image, 
   required this.body, 
}
   
);
}

class OnBoardingScreen extends StatefulWidget
 {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
 {
  var boardController = PageController();
  List <BoardingModle> boarding = [
    BoardingModle(
      title: 'page one' ,
      body:'health' ,
      image: 'assets/images/health.png' 
    ),
     BoardingModle(
      title: 'page two' ,
      body:'cat' ,
      image: 'assets/images/cat.png' 
    ),
     BoardingModle(
      title: 'page three' ,
      body:'love' ,
      image: 'assets/images/love.png' 
    )
  ];
  bool isLast = false;
  void submit(){
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
if(value!){
  navigateTo(context, ShopLogin());
}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      actions: [
       TextButton(onPressed: (){
        navigateTo(context, ShopLogin());
       }, child: Text("SKIP"))
      ],
     ),
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged:(int index){
                  if(index == boarding.length -1){
                    isLast =true;
                    
                  }else{
                    isLast = false;
                  }
                } ,
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder:(context, index) =>buildBoardingItem(boarding[index]) ,
              itemCount: boarding.length),
            ),
            SizedBox(height: 40,),
            Row(children: [
              SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: defaultColor,
                dotHeight: 10,
                dotWidth: 5,
                expansionFactor: 5,
                spacing: 4
                ),
                controller: boardController, 
                count: boarding.length),
              Spacer(),
              FloatingActionButton(onPressed: ()
              {
                if(isLast){
                submit();
                }else{
boardController.nextPage(duration:Duration(microseconds: 700) , curve: Curves.fastLinearToSlowEaseIn);
                }


              },
              child: Icon(Icons.arrow_forward_ios_outlined),
              )
            ],)
          ],
        ),
      )
    );
  }

  Widget buildBoardingItem(BoardingModle modle)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
    Expanded(
      child: Image(
        image: AssetImage(modle.image ))),
   
    Text(modle.title ,style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),),
     SizedBox(height: 24,),
      Text(modle.body,style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold
    ),),
    SizedBox()
    
    
      ]),
  );
}