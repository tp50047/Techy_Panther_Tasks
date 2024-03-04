import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'main.dart';

class LoginController extends GetxController {
  final Dio _dio = Dio(); // Initialize Dio instance
  final phoneNumber = ''.obs; // Observable phone number
  final authToken = ''.obs; // Observable auth token

  Future<void> login() async {
    //|| authToken.value.isEmpty
    if (phoneNumber.value.isEmpty ) {
      // Show error message if phone number or auth token is empty
      Get.snackbar('Error', 'Phone number and auth token are required.');
      return;
    }

    try {
      final response = await _dio.post(
        'http://3.133.138.51/api/app/users/login',
        data: {
          'phoneNo' : phoneNumber.value,
       //   'auth_token' : authToken.value,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful login
        print('Login Successful: ${response.data}');

        // If login successful, navigate to next page
        Get.to(NextPage());
      } else {
        // Handle login error
        print('Login Error: ${response.statusCode}');
        Get.snackbar('Error', 'Login failed. Please try again.');
      }
    } catch (error) {
      // Handle other errors
      print('Login Error: $error');
      Get.snackbar('Error', 'Failed to connect. Please try again later.');
    }
  }
}