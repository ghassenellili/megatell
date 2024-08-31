import 'package:flutter/material.dart';

class OrderConfirtmed extends StatefulWidget {
  const OrderConfirtmed({Key? key}) : super(key: key);

  @override
  State<OrderConfirtmed> createState() => _OrderConfirtmedState();
}

class _OrderConfirtmedState extends State<OrderConfirtmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/a1Dark.png'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/iphone.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Order Confirmed!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0,
                      0),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'We will send you a confirmation email.',
                style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 110, 110,
                        110)),
              ),
              const SizedBox(height: 150),
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                ),
                child: const Text(
                  'Go to Orders',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
