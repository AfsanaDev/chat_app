import 'package:chat_app/components/my_submit_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final void Function()? onTap;
  const RegisterPage({super.key , required this.onTap});


  void register(){

  }

 

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
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
          Text("Let's create an account for you",
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
           SizedBox(height: 10),
           MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              tEController: confirmPasswordController,
            ),
          SizedBox(height: 25),
          MySubmitButton(buttonText: "Register",
           onTap: register,),
           SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),),
              GestureDetector(
                onTap: onTap,
                child: Text("Login now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),),
              ),
            ],
          ),
        ],
       ),
     ),
    );
  }
}