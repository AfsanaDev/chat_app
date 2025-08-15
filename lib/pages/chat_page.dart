import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  final String receiverEmail;
  final String receiverId;
  
  ChatPage({super.key, 
  required this.receiverEmail,
   required this.receiverId});

  TextEditingController _messageTEcontroller = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message function
  void sendMessage()async{
    try{
      if(_messageTEcontroller.text.isNotEmpty){
        await _chatService.sendMessage(receiverId, _messageTEcontroller.text);
      //clear the controller
      _messageTEcontroller.clear();
    }
    }on FirebaseException catch(e){
      // showDialog(context: context, builder: (context) {
      //   return AlertDialog(
      //     title: Text("Error"),
      //     content: Text(e.message ?? "An error occurred"),
      //   );\
      Text("Error: ${e.message}");
      };
    }
    
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //display messages
          Expanded(
            child: _buildMessageList(),
          ),


          //user input
          _buildUserInput(),

          SizedBox(height: 50,),
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverId, senderId), 
      builder: (context, snapshot){
        //error
        if(snapshot.hasError){
          return Center(child: Text("Error loading messages"));
        }

        //loading
        if(snapshot.connectionState ==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        //return list view
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          
        );
      });
  }
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"],);
  }


  // build a text field for user input
  Widget _buildUserInput(){
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            hintText: "Type a message", 
            obscureText: false, 
            tEController: _messageTEcontroller),),

          IconButton(onPressed: sendMessage, icon: Icon(Icons.send))  
      ],
    );
  }

}