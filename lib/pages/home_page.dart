import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
 HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Home Page"),
        // actions: [
        //   IconButton(
        //     onPressed: logOut, icon: Icon(Icons.logout))
        // ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users except foe the current logged in user
  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(), 
      builder: (context, snapshot){
        // error 
        if(snapshot.hasError){
          return Text("Error");
        }
        //loading
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        // return list view

        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      });
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
    if(userData["email"] !=_authService.getCurrentUser()!.email){
      return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ChatPage(receiverEmail: userData["email"], receiverId: userData["uid"],)));
      }

      );
    }else{
      return Container();
    }
  }


 
}

