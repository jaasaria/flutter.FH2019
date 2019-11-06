import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fh2019/core/shared/custom_enum.dart';

class BaseModel with ChangeNotifier {
  PageLoadingStatus _pageStatus = PageLoadingStatus.Loading;

  bool _busy = false;
  String _errorMessage;

  bool get busy => _busy;
  String get errorMessage => _errorMessage;
  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  // Status getters
  bool get isLoading => _pageStatus == PageLoadingStatus.Loading;
  bool get loadingFailed => _pageStatus == PageLoadingStatus.Error;
}
