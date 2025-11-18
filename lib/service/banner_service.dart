import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/banner_model.dart';

class BannerService {
  static const String baseUrl = 'https://karyana-apis-backend.vercel.app';
  static const String bannersEndpoint = '/api/banners';

  static Future<BannerModel> getBanners() async {
    try {
      final url = Uri.parse('$baseUrl$bannersEndpoint');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final bannerResponse = bannerResponseFromJson(response.body);

        if (bannerResponse.success) {
          return bannerResponse;
        } else {
          throw Exception('Failed to load banners');
        }
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Failed to fetch banners');
      }
    } catch (e) {
      throw Exception('Banner fetch error: ${e.toString()}');
    }
  }
}