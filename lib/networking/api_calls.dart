import 'package:http/http.dart' as http;
import 'package:tafadzwa/models/user_model.dart';
import 'dart:convert';

import 'package:tafadzwa/utils/constants.dart';

class ApiCalls{
  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(Uri.parse(userApi));
    return json.decode(result.body)['users'];

  }
}