import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiService {
  final String _baseUrl = 'https://yourapi.com';
  final AuthService _authService = AuthService();

  Future<http.Response> getData() async {
    final token = await _authService.getToken();
    return await http.get(
      Uri.parse('$_baseUrl/data'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}
