import 'package:flutter/material.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

@override
  Widget build(BuildContext context) {
  return MaterialApp(
   
    debugShowCheckedModeBanner: false,
    home: TextInputPage()
    );
  }
}
class TextInputPage extends StatefulWidget {
  const TextInputPage({super.key});

  @override
  State<TextInputPage> createState()=>_TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String displayedName = '';
  String displayedSection = '';
  String displayedAddress = '';

  void displayBiodata() {
    setState(() {
      displayedName = nameController.text.trim();
      displayedSection = sectionController.text.trim();
      displayedAddress = addressController.text.trim();
    });
  }

  bool get hasBiodata =>
      displayedName.isNotEmpty ||
      displayedSection.isNotEmpty ||
      displayedAddress.isNotEmpty;
@override
void dispose() {
  nameController.dispose();
  sectionController.dispose();
  addressController.dispose();
  super.dispose();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('My Biodata'),
      backgroundColor: const Color.fromARGB(255, 163, 0, 222),
      foregroundColor: const Color.fromARGB(255, 225, 225, 225),
    ),
    body: Padding(padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Name',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,      
                )
        ),
        const SizedBox(height: 10),
        TextField (
          controller: nameController,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            labelText: 'Enter your name',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person)
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Section',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
        ),
        const SizedBox(height: 10),
        TextField (
          controller: sectionController,
          decoration: const InputDecoration(
            labelText: 'Enter your section',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.class_)
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
        ),
        const SizedBox(height: 10),
        TextField (
          controller: addressController,
          maxLines: 2,
          decoration: const InputDecoration(
            labelText: 'Enter your address',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.home)
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: displayBiodata, child: const Text('Display Biodata'),),
         const SizedBox(height: 30,),

        const Text('Output', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: hasBiodata
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $displayedName',
                  style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 0, 225))),
                const SizedBox(height: 8),
                Text('Section: $displayedSection',
                  style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 0, 225))),
                const SizedBox(height: 8),
                Text('Address: $displayedAddress',
                  style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 0, 225))),
              ],
            )
            : const Text('No biodata entered yet',
              style: TextStyle(fontSize: 18, color: Colors.grey)),
        ),



      ],
    ),
    ),
    )
  );
} 
}