import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardButton(
              label: 'This Month Spends',
              value: '\$500', // Replace with actual value
              onPressed: () {
                // Implement action for This Month Spends button
              },
            ),
            SizedBox(height: 20.0),
            DashboardButton(
              label: 'Credit Score',
              value: '750', // Replace with actual value
              onPressed: () {
                // Implement action for Credit Score button
              },
            ),
            SizedBox(height: 20.0),
            DashboardButton(
              label: 'Offers',
              value: '3', // Replace with actual number of offers
              onPressed: () {
                // Implement action for Offers button
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final String value;
  final Function()? onPressed;

  const DashboardButton({
    required this.label,
    required this.value,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          primary: Colors.black.withOpacity(0.5),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
