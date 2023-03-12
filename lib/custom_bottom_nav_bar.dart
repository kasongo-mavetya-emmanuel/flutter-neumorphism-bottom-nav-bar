
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  int _currentIndex=0;
  PageController _pageController=PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPressed(int index){

    setState(() {
      _currentIndex=index;
    });

    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //PAGES
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              itemCount: 4,
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
              return Center(
                child: Text('Page ${index+1}'),
              );
            }),
          ),

          //app bar
          Positioned(
              top: 25,
              left: 10,
              right: 10,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset:Offset(-8.0,-8.0),
                          //spreadRadius: -1.0,
                          blurRadius: 15.0,
                        ),

                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset:Offset(8.0,8.0),
                          //spreadRadius: -1.0,
                          blurRadius: 15.0,
                        ),
                      ]
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text('CUSTOM BOTTOM NAV BAR',style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18,
                        foreground: Paint()..color= Colors.grey.withOpacity(0.7),
                      ),
                        textAlign: TextAlign.center,),


                      Text('CUSTOM BOTTOM NAV BAR',style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 18,
                          foreground: Paint()..strokeWidth=1..color= Colors.black54..style=PaintingStyle.stroke,
                          //PaintingStyle.stroke..strokeWidth=10..color= Colors.red,
                          //color: Colors.black12,
                          shadows: [
                            // BoxShadow(
                            //   color: Colors.black87,
                            //   spreadRadius: 5.0,
                            // ),
                            //
                            // BoxShadow(
                            //   color: Colors.black54,
                            //   //offset:Offset(-2.0,-2.0),
                            //   spreadRadius: 5.0,
                            //   blurRadius: 20.0,
                            // )

                          ]),
                        textAlign: TextAlign.center,),
                    ],
                  )
              )),
          //bottom nav bar
          Positioned(
            bottom: 8,
              left: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(8.0,8.0),
                      blurRadius: 15.0
                    ),
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(-8.0,-8.0),
                        blurRadius: 15.0
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: BottomBarItem(
                          title: 'Home',
                          icon: Icons.home_outlined,
                          isPressed: _currentIndex==0,
                          onTap: () {
                            onPressed(0);
                          },)),
                    Expanded(
                        child: BottomBarItem(
                          title: 'Chat',
                          icon: Icons.chat_bubble_outline,
                          isPressed: _currentIndex==1,
                          onTap: () {
                            onPressed(1);
                          },)),
                    Expanded(
                        child: BottomBarItem(
                          title: 'Cart',
                          icon: Icons.shopping_cart_outlined,
                          isPressed: _currentIndex==2,
                          onTap: () {
                            onPressed(2);
                          },)),
                    Expanded(
                        child: BottomBarItem(
                          title: 'Profile',
                          icon: Icons.person_outline,
                          isPressed: _currentIndex==3,
                          onTap: () {
                            onPressed(3);
                          },)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  IconData icon;
  String title;
  bool isPressed;
  VoidCallback onTap;
  BottomBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isPressed?Colors.transparent: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            isPressed?BoxShadow(
              color: Colors.black12,
            ): BoxShadow(
              color: Colors.white
            ),
            isPressed?BoxShadow(
              color: Colors.white,
              offset: Offset(2.0,2.0),
              spreadRadius: -1.0,
              blurRadius: 5.0,
            ):BoxShadow(
              color: Colors.white,
            )
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 25, color: isPressed?Colors.blue.shade200:Colors.black54,),
            Text(title, style: TextStyle(fontSize: 9,color: isPressed?Colors.blue.shade200:Colors.black38),),
          ],
        ),
      ),
    );
  }
}
