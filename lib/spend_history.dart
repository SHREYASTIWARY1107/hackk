import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpendHistoryPage extends StatefulWidget {
  @override
  _SpendHistoryPageState createState() => _SpendHistoryPageState();
}

class _SpendHistoryPageState extends State<SpendHistoryPage> {
  List<Transaction> _transactions = [];
  List<Transaction> _filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    // Fetch transactions when the page initializes
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    try {
      // Replace 'http://your-flask-api-url/extract_amount' with your actual API URL
      final response = await http.post(
        Uri.parse('http://your-flask-api-url/extract_amount'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'sms': 'Your SMS message here', // Replace with actual SMS message
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> transactionData = jsonDecode(response.body);
        // Process transaction data here
        // For example:
        // final String transactionType = transactionData['transaction_type'];
        // final double amount = double.parse(transactionData['amount']);
        // _transactions.add(Transaction(type: transactionType, amount: amount));
        // setState(() {
        //   _filteredTransactions.addAll(_transactions);
        // });
      } else {
        throw Exception('Failed to fetch transactions');
      }
    } catch (error) {
      print('Error fetching transactions: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spend History'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Add widgets to display transaction history here
        ],
      ),
    );
  }
}

class Transaction {
  final String type;
  final double amount;

  Transaction({required this.type, required this.amount});
}
