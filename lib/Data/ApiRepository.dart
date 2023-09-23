
import 'package:flutter/material.dart';
import 'package:foodpanda/Constants/VarConstants.dart';
import 'package:foodpanda/Modal/ApiModal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding


class ApiRepository{

    static Future<List<dynamic>?> fetchProducts() async {
      try{
        final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
        if (response.statusCode == 200) {
          // List<dynamic> data = json.decode(response.body);
          List products = productsFromJson(response.body);
          // print("data $products");
          VarConstants.ApiProducts = products;
          return products;
        }
      }catch(e){
        throw Exception('Failed to load products');
      }
      return null;
      }
}