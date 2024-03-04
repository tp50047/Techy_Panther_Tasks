import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginusingetx/login_controller.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}



class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

   LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) => _loginController.phoneNumber.value = value,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            // TextFormField(
            //   onChanged: (value) => _loginController.authToken.value = value,
            //   decoration: InputDecoration(labelText: 'Auth Token'),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _loginController.login(),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(
        child: Text('Welcome to the next page!'),
      ),
    );
  }
}