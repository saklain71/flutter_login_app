
import 'package:flutter/material.dart';
import 'package:flutter_first/ui/home_page.dart';
import 'package:flutter_first/ui/main_screen.dart';
import 'package:flutter_first/ui/registration.dart';
import 'package:flutter_first/ui/validator.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Bd Com Flutter App';  //Static Const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bd Com Flutter App"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login page',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),

              //email
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (val){
                    // Validator validate =  Validator();
                    // validate.isValidEmail(val!);
                   //Validator.isValidEmail(val!);
                   if(Validator.isValidEmail(val!)){
                     return null;
                     // if ( emailVal) return null;
                     // else return 'Enter a Valid Email';
                  }
                   return 'Enter valid Email';
                  },
                  //obscureText: true,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),

              //password
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                validator: (val){
                 // Validator.isValidPassword(val!);
                  if(Validator.isValidPassword(val!)){
                    return null;
                    // if ( emailVal) return null;
                    // else return 'Enter a Valid Email';
                  }
                 // return 'Enter valid Email';
                  return 'Need valid PassWord';
                  // if ( emailPass) return null;
                  // else

                },
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),


              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    }
                    print(nameController.text);
                    print(passwordController.text);
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Registration()),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
