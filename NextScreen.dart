import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megatel/screens/LoginScreen.dart';
import 'package:megatel/screens/intro.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/cenapp.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Connect with confidence and get things done',
                    style: GoogleFonts.alkalami(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 12, 12, 12),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "At Mega Tel we specialise in outstanding communication sulotions, offering high-quality services tailored to your individuel needs.whether you require seamless call handing,personalized support, or innovative strategies,we're here to exceed your expectations.Your statisfaction is not just our goal-it's our promise..",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: const Color.fromARGB(255, 7, 7, 7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Material(
              color: const Color.fromARGB(122, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),          );
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Material(
              color: const Color.fromARGB(122, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
