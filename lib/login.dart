import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dashboard.dart'; // Import your dashboard page here

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Call requestSmsPermission here
    requestSmsPermission(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate credentials and perform login
                // For simplicity, skipping validation for now
                // For actual implementation, use a proper authentication mechanism
                // For now, navigating to dashboard directly after login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                // Navigate to sign up page
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'New user? Sign up here',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to request SMS permission
  void requestSmsPermission(BuildContext context) async {
    final PermissionStatus status = await Permission.sms.request();
    if (!status.isGranted) {
      // Permission denied, handle accordingly
      print('SMS permission is required for certain features.');
    }
  }
}
