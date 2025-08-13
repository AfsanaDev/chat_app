import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_submit_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final void Function()? onTap;
  RegisterPage({super.key , required this.onTap});


  void register(BuildContext context){
    final _auth =AuthService();
   if( _passwordController.text.trim() == _confirmPasswordController.text.trim()){
    try{
       _auth.signUpWithEmailPassword(
      _emailController.text.trim(), _passwordController.text.trim()) ;
    }catch(e){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
        );
      });
    }
   }else{
    showDialog(context: context, 
    builder: (context) {
        return AlertDialog(
          title: Text("Password don't match"),
          //content: Text("Password does not match"),
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
          Text("Let's create an account for you",
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
           SizedBox(height: 10),
           MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              tEController: _confirmPasswordController,
            ),
          SizedBox(height: 25),
          MySubmitButton(
            buttonText: "Register",
           onTap:()=> register(context) ,),
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