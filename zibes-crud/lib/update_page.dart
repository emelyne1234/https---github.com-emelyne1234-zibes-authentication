import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final String documentId;

  const UpdatePage({Key? key, required this.documentId}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Updating document with ID: ${widget.documentId}'),
            // Add your update page content here
          ],
        ),
      ),
    );
  }
}
