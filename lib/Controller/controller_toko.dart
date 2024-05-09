import 'package:http/http.dart' as http;
import 'dart:convert';

class TokoController {
  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.100.6/api_pam/read.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    }
  }

  Future<bool> addToko(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.6/api_pam/create.php'),
        body: {
          'nama_toko': data['nama_toko'],
          'alamat': data['alamat'],
          'notelp': data['notelp'],
          'kesan': data['kesan'] ?? '',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to add data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to add data');
    }
  }

  Future<bool> editToko(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.6/api_pam/edit.php'),
        body: {
          'id': data['id'],
          'nama_toko': data['nama_toko'],
          'alamat': data['alamat'],
          'notelp': data['notelp'],
          'kesan': data['kesan'] ?? '',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to edit data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to edit data');
    }
  }

  Future<bool> deleteToko(String id) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.100.6/api_pam/delete.php'),
        body: {
          'id': id,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete data');
    }
  }
}
