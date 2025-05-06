
import 'package:event_book_app/admin/upload_event.dart';
import 'package:event_book_app/pages/bottomnav.dart';
import 'package:event_book_app/pages/details.dart';
import 'package:event_book_app/pages/home.dart';
import 'package:event_book_app/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51RK7rDRh9j4MgHPXwu6LuCRkuNHk6GN5vypPMpTKVFecFc4byKr5wlKwQNgg5kSZ0NR4sOgnG28O0ftmHfIlZjw700GsHT6shQ';
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: Signup(),
    );
  }
}
