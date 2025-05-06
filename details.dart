import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import '../services/data.dart';
import 'bottomnav.dart';
import 'home.dart';

class Detail extends StatefulWidget {
  final String price;
  const Detail ({super.key, required this.price});

  @override
  State<Detail > createState() => _DetailState();
}
class _DetailState extends State<Detail>{
  Map<String, dynamic>? paymentIntent;
  int ticket = 1;
  int total = 0;

@override
void initState(){
  total = int.parse(widget.price);
  super.initState();
}

  @override
  Widget build (BuildContext context){
    return Scaffold(
        body:Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                    children: [
                      Image.asset("images/hack.png",
                          height:MediaQuery.of(context).size.height/2.8 ,
                          width:MediaQuery.of(context).size.width, fit:BoxFit.cover
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.height/2.8 ,
                        width:MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => BottomNav()), // Navigate to BottomNav
                                      (route) => false, // Removes all previous routes
                                );
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top:40,left:20),
                                  padding:EdgeInsets.all(5) ,
                                  decoration: BoxDecoration(color:Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child:Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.black)
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left:20),
                              width:MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color:Colors.black12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    Text("Hackheavn 2.0",
                                      style: TextStyle(color:Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(children:[
                                      Icon(Icons.calendar_month, color: Colors.white,),
                                      SizedBox(width: 10),
                                      Text("22 May 2025",
                                        style: TextStyle(color:Colors.white70 ,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width:15),
                                      Icon(Icons.location_on_outlined, color: Colors.white,),
                                      SizedBox(width:6),
                                      Text("G.L.Bajaj, Mathura",
                                        style: TextStyle(color:Colors.white70 ,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    SizedBox(height:10),
                                  ]),
                            )
                          ],
                        ),
                      )
                    ]),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text("About Event",
                    style: TextStyle(
                        color:Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Text("A hackathon is an intense, time-bound event where "
                      "developers, designers,and innovators come together to build "
                      "creative tech solutions.Participants form teams, brainstorm "
                      "ideas, and rapidly prototype apps or products, often within "
                      "24–72 hours.It's a great platform to learn, network, and turn "
                      "ideas into reality.Hackathons encourage innovation, problem-solving,"
                      "and collaboration under pressure.",
                    style: TextStyle(
                        color:Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: Row(
                      children: [
                        Text("No Of Members :",
                          style: TextStyle(
                              color:Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width:50),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.black54, width:2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                GestureDetector(
                                  onTap:(){
                                    total = total-int.parse(widget.price);
                                    if (ticket > 1) {
                                      setState(() {
                                        ticket--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: Color(0xff6351ec),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ),
                                Text(
                                  "$ticket",
                                  style: TextStyle(
                                    color: Color(0xff6351ec),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                GestureDetector(
                                  onTap: () {
                                    total = total+int.parse(widget.price);
                                    setState(() {
                                      ticket++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: Color(0xff6351ec),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ),
                              ]
                          ),),

                      ]),
                ),

                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right:10),
                    child: Row(
                        children:[
                          Text(
                            "Amount : $total",
                            style: TextStyle(
                              color: Color(0xff6351ec),
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width:20
                          ),
                          GestureDetector(
                            onTap: (){
                                makePayment(context, total.toString());
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xff6351ec), borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Register Here",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
              ],
            )
        )
    );
  }
}

Future<void> makePayment(BuildContext context, String amount) async{
  try{
     var paymentIntent = await createPaymentIntent(amount, 'INR');
    await Stripe.instance
    .initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent?['client_secret'],
        style: ThemeMode.dark,
        merchantDisplayName: "Adnan"))
   .then((value){});

  displayPaymentSheet(context, amount);
 }catch(e, s){
    print('exception: $e$s');
    }
  }

  displayPaymentSheet(BuildContext context , String amount) async{
  try{
    await Stripe.instance.presentPaymentSheet().then((value) async{
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder:(_) => AlertDialog(
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color:Colors.green,
                    ),
                    Text("Payment Successfully")
                  ],
                )
              ],
            )
          ) );
    }).onError((error, stackTrace){
      print("Error is :--->$error $stackTrace");
    });
  } on StripeException catch(e){
    print("Error is :---> $e");
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text("cancelled"),
        ));
    } catch (e){
    print("$e");
    }
  }
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency':currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          "Authorization": "Bearer $secretkey",
          "Content-Type": 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      return jsonDecode(response.body);
    }catch(err) {
      print("err charging user: ${err.toString()}");
    }
  }
  calculateAmount(String amount) {
  final calculationAmount = (int.parse(amount)* 100);

  return calculationAmount.toString();
  }

