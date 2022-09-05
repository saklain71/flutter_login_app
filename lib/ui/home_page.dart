// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         centerTitle: true,
//         elevation: 0,
//         actions: [
//      Padding(
//        padding: const EdgeInsets.all(2.0),
//        child: IconButton(onPressed: (){} ,
//            icon: Icon(
//                 Icons.logout,
//                 size: 30,
//              ) ),
//      )
//         ],
//       ),
//       body: Column(
//         children: [],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../data/model/post.dart';
import '../data/data_source/post_data_source.dart';
import '../ui/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),

      body:FutureBuilder(
        future:PostDataSource.getData() ,


        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          List<Post>? postList = snapshot.data;
          print(postList);

          if (postList == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(postList[index].title.toString()),
                  subtitle: Text(postList[index].completed.toString()),
                  leading: Text(postList[index].id.toString()),
                );
              });

        },



      ) ,
    );
  }
}


