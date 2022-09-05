
import 'package:flutter/material.dart';
import 'package:flutter_first/ui/home_page.dart';
import 'package:flutter_first/ui/validator.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //static const String _title = 'Bd Com Flutter App';  //Static Const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _registration();
}

class _registration extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    'Registration page',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (val){
                    // Validator validate =  Validator();
                    // validate.isValidEmail(val!);
                    //Validator.isValidEmail(val!);
                    // if(Validator.isValidName(val!)){
                    //   return null;
                    //   // if ( emailVal) return null;
                    //   // else return 'Enter a Valid Email';
                    // }
                    // return 'Enter Your Name With Capital Letter';
                  },
                  //obscureText: true,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Name',
                  ),
                ),
              ),

              //name
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
                    return 'Enter Your Valid Email';
                  },
                  //obscureText: true,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Email',
                  ),
                ),
              ),

              //phonenumber
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (val){
                    // Validator.isValidPassword(val!);
                    if(Validator.isValidPhone(val!)){
                      return null;
                      // if ( emailVal) return null;
                      // else return 'Enter a Valid Email';
                    }
                    // return 'Enter valid Email';
                    return 'Valid phone Number';
                    // if ( emailPass) return null;
                    // else

                  },
                  obscureText: true,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),

              // password
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (val){
                    // Validator validate =  Validator();
                    // validate.isValidEmail(val!);
                    //Validator.isValidEmail(val!);
                    if(Validator.isValidPassword(val!)){
                      return null;
                      // if ( emailVal) return null;
                      // else return 'Enter a Valid Email';
                    }
                    return 'Enter Valid Password';
                  },
                  //obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              //password

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
                  child: const Text('Sign Up'),
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
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    }
                    print(nameController.text);
                    print(passwordController.text);
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Already Signed Up?'),
                  TextButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
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
