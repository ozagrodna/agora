import 'package:flutter/material.dart';
import '../components/page_container/page_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PageContainer(
        child: Center(
          child: Text(
            'Hello Agora!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}