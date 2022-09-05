
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/post.dart';

class PostDataSource {


  static  Future<List<Post>?> getData() async {
    try {
      //var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1/comments');
      var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

      var response = await http.get(url);

      print("Json response Post response>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $response");
      // if (response.statusCode == 200) {
      //   List<Post> _posts = postFromJson(response.body);
      //   return _posts;
      // }
      if(response.statusCode == 200){
        List<Post> _posts = postFromJson(response.body);

        print("Json response after data Modeling>>>>>>>>>>>>>>>>>>>>>>>>>>>> $_posts");
        return _posts;
      }
    } catch (e) {
      print(e.toString());
    }
  }


}

class _posts {
}
