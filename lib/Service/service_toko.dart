import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ucppam/Data/class_toko.dart';

class TokoService {
  final String baseUrl = 'http://192.168.100.6/api_pam';

  Future<List<Toko>> fetchAll() async {
    final response = await http.get(Uri.parse('$baseUrl/read.php'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => Toko.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Toko> create(Toko toko) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create.php'),
      body: json.encode(toko.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Toko.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create data');
    }
  }

  Future<void> update(Toko toko) async {
    final response = await http.post(
      Uri.parse('$baseUrl/edit.php'),
      body: json.encode(toko.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update data');
    }
  }

  Future<void> delete(String id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/delete.php'),
      body: {'id': id},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    }
  }
}
