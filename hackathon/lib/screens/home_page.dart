import 'package:flutter/material.dart';
import 'package:hackathon/widgets/textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarder'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTextField(
            hintText: 'Enter name',
            label: 'First Name',
            controller: nameController,
          ),
        ],
      ),
    );
  }
}
