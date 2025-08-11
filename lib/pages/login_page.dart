import 'package:chat_app/components/my_submit_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  void login(){

  }

 

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.surface,

     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat,
          size: 60,
          color: Theme.of(context).colorScheme.primary,),
          SizedBox(height: 50,),
          Text("Welcome Back, you've been missed",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
          ),),
          SizedBox(height: 25),
          MyTextField(hintText: 'Email',
           obscureText: false, 
           tEController: emailController,),
          SizedBox(height: 10),
          MyTextField(hintText: 'Password',
           obscureText: true, 
           tEController: passwordController,),
          SizedBox(height: 25),
          MySubmitButton(buttonText: 'Login',
           onTap: login,),
           SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member? ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),),
              Text("Register now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),),
            ],
          ),
        ],
       ),
     ),
    );
  }
}