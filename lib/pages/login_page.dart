import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_submit_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});


 
  void login(BuildContext context)async{
    final authService = AuthService();
    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }catch(e){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
        );
      });
    }
  }
 

  @override
  Widget build(BuildContext context) {
    
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
           tEController: _emailController,),
          SizedBox(height: 10),
          MyTextField(hintText: 'Password',
           obscureText: true, 
           tEController: _passwordController,),
          SizedBox(height: 25),
          MySubmitButton(buttonText: 'Login',
           onTap: () => login(context),),
           SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member? ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),),
              GestureDetector(
               onTap: onTap,
                child: Text("Register now",
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