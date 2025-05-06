import 'package:flutter/material.dart';

import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:50.0, left:20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color( 0xffe3e6ff),Color( 0xfff1f3ff),Colors.white],
            begin: Alignment.bottomLeft,
            end:  Alignment.bottomRight,
          ),),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text('VIPS, Shalimar Bagh', style:TextStyle(color:Colors.black, fontSize: 20, fontWeight:FontWeight.w500),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Hello, Jeet",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("There are 25 events\n near your location.",
              style: TextStyle(
                color: Color(0xff6351ec),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(left:20, right: 20),
                width: MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search_outlined,
                      ),
                      border:InputBorder.none, hintText: "Search a Event "
                  ),
                )
            ),
            SizedBox(height: 20),
            SizedBox(
              height:120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/hacathon.png", height: 30, width:30, fit:BoxFit.cover),
                            Text("HackTech", style: TextStyle(color: Colors.black, fontSize: 20),),],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:30),
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/education.png", height: 30, width:30, fit:BoxFit.cover),
                            Text("Book Fair", style: TextStyle(color: Colors.black, fontSize: 20),),],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:30),
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/clothing.png", height: 30, width:30, fit:BoxFit.cover),
                            Text("Clothing", style: TextStyle(color: Colors.black, fontSize: 20),),],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:30),
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/fest.png", height: 30, width:30, fit:BoxFit.cover),
                            Text("Fest", style: TextStyle(color: Colors.black, fontSize: 20),),],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:30),
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/food.png", height: 30, width:30, fit:BoxFit.cover),
                            Text("Food", style: TextStyle(color: Colors.black, fontSize: 20),),],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width:30),
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/marothon.jpeg", height: 30, width:30, fit:BoxFit.cover),
                            Text("Marathon", style: TextStyle(color: Colors.black, fontSize: 20),),],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upcoming Events",style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),

                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: Text("see all",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                ]
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right:20),
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(price: "100"), // Pass actual price or any data here
                          ),
                        );},
                      child: Image.asset("images/hack.png",height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit:BoxFit.cover
                      ),
                    ),
                  ),

                  Container(
                    width: 60,
                    margin: EdgeInsets.only(left: 5, top: 5),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text("May\n22-23",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hackhaven 2.0 Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:20.0),
                  child: Text("\$10",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Color(0xff6351ec),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              Icon(Icons.location_on_rounded),
              Text("G.L Bajaj, Mathura",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]
            ),
          ],
        ),
      ),
    );
  }
}