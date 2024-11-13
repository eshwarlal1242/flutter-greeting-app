import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greeting Card',

      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  String greeting = '';

  void showGreeting() {
    setState(() {
      // Remove leading/trailing whitespace
      final String name = nameController.text.trim();

      // Check if name is not empty
      if (name.isNotEmpty) {
        greeting = 'Hello, $name!';
      } else {
        greeting = 'Please enter your name!';
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Greeting Card'),
      ),
      body: Container(
          decoration: const BoxDecoration(
         image: DecorationImage(
         image: AssetImage('images/background.png'), // Add your image path
         fit: BoxFit.cover,
      ),
          ),
    child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Sharp edges
                ),
                side: const BorderSide(
                  // Darker brick red border
                  width: 2,
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: showGreeting,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Show Greeting'),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              greeting,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
    ),
      ),

    );
  }
}