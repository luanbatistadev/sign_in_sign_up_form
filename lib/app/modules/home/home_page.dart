import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('You logged in'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushReplacementNamed('/sign_up/');
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
