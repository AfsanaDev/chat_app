import 'package:flutter/material.dart';

class MySubmitButton extends StatelessWidget{
  const MySubmitButton({super.key, 
  required this.buttonText, required this.onTap, });

  final String buttonText ;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(buttonText,
            
          ),
        ),
      ),
    );
  }
}