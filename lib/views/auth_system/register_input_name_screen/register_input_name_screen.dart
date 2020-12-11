import 'package:flutter/material.dart';
import 'package:instagram/ultimate/helpers.dart';
import 'components/body.dart';

class RegisterInputNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20 , right: 20 , bottom: 30),
        child: Text(
          getTranslated(context, 'note_text'),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Body(),
    );
  }
}
