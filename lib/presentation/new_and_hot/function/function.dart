import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/models/pages/pages.dart';
import 'package:netflix/models/trending/trending.dart';
import 'package:http/http.dart' as http;

class NewAndHotFunctions {
  static List<Movies> discover = [];
  static List<Movies> trending = [];
  static String mainImage = '';
  static Future<void> getDiscover() async {
    try {
      final response = await http.get(Uri.parse(discoveUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        mainImage = pages.results![7].posterPath!;
        discover.addAll(pages.results!);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> getTrending() async {
    try {
      final response = await http.get(Uri.parse(trendingUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Pages pages = Pages.fromJson(data);
        trending.addAll(pages.results!);
      }
    } catch (e) {}
  }
}
