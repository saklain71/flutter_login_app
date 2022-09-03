import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
        actions: [
     Padding(
       padding: const EdgeInsets.all(2.0),
       child: IconButton(onPressed: (){} ,
           icon: Icon(
                Icons.logout,
                size: 30,
             ) ),
     )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
