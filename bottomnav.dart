
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:event_book_app/pages/booking.dart';
import 'package:event_book_app/pages/home.dart';
import 'package:event_book_app/pages/profile.dart';
import 'package:flutter/material.dart';

import '../admin/upload_event.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}
class _BottomNavState extends State<BottomNav>{
  late List<Widget> pages;
  late Home home;
  late Booking booking;
  late Profile profile;
  int currentTabIndex= 0;


  @override
  void initState() {
    home = Home();
    booking = Booking();
    profile = Profile();
    pages = [home, booking, profile];
    super.initState();
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap:(int index){
            setState((){
              currentTabIndex = index;
              // If Profile tab is selected, navigate to UploadEvent page
              if (currentTabIndex == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadEvent()), // Navigate to UploadEvent
                );
              }
            });
          },

          items:[
            Icon(
              Icons.home_outlined,
              color: Colors.white, size: 30,
            ),
            Icon(
              Icons.book,
              color:Colors.white,size: 30,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,size: 30,
            ),
          ]
      ),
      body:pages[ currentTabIndex],
    );
  }

}