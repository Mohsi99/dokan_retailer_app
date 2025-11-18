import 'package:flutter/material.dart';
import '../model/banner_model.dart';
import '../service/banner_service.dart';

class BannerProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<BannerItem> _banners = [];
  String? _errorMessage;

  bool get isLoading => _isLoading;
  List<BannerItem> get banners => _banners;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBanners() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final bannerResponse = await BannerService.getBanners();
      _banners = bannerResponse.banners;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}