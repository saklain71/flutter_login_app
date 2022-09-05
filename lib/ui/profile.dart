import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      //to avoid RenderFlex error

      body: SingleChildScrollView(
        child: Column(
          children: [


            Row(children: [
              Text("Name:"),
              SizedBox(width: 10,),
              Text("Saqlain Mustak")
            ],),

            Row(children: [
              Text("Email:"),
              SizedBox(width: 10,),
              Text("s@gmail.com")
            ],),

            Row(children: [
              Text("Password:"),
              SizedBox(width: 10,),
              Text("Ssasa12@@")
            ],),

            ElevatedButton(onPressed:(){
              Navigator.pop(context);
            },
              child: Text("Log out:"), )
          ],

        ),
      ),

    );
  }
}
