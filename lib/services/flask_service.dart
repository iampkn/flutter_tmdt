import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:price_alert/models/ListSymbols.dart';

class FlaskProvider {
  static const String _baseUrl = 'https://flask-alert-be.vercel.app';

  Future<void> addAlert(
    String userId,
    String selectedTradingPair,
    String targetPrice,
  ) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/register_alert'),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonEncode({
          'user_id': userId,
          'price': targetPrice,
          'trading_pair': selectedTradingPair,
        }),
      );
    } catch (e) {
      print('Error registering alert: $e');
    }
  }

  Future<List<String>> getTradingPairs() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/get_trading_pairs'),
      );
      final ListSymbols listSymbols = listSymbolsFromJson(response.body);
      return listSymbols.symbols;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<void> deleteAlert(String userId, String selectedTradingPair) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/delete_alert'),
        body: {
          'user_id': userId,
          'trading_pair': selectedTradingPair,
        },
      );
    } catch (e) {
      print('Error deleting alert: $e');
    }
  }

  Future<void> updateAlert(
    String userId,
    String selectedTradingPair,
    String targetPrice,
  ) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/update_alert'),
        body: {
          'user_id': userId,
          'price': targetPrice,
          'trading_pair': selectedTradingPair,
        },
      );
    } catch (e) {
      print('Error updating alert: $e');
    }
  }

  Future<void> addDevice(String userId, String token) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/add_device'),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonEncode({
          'user_id': userId,
          'token': token,
        }),
      );
    } catch (e) {
      print('Error updating token: $e');
    }
  }
}
