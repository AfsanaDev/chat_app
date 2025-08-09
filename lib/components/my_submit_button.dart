import 'package:flutter/material.dart';

class MySubmitButton extends StatelessWidget{
  const MySubmitButton({super.key, });

  //final String buttonText ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Text('Login'),
    );
  }
}