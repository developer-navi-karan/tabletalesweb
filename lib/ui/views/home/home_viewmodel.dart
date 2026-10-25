import 'package:flutter/material.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_user.dart';
import 'package:tabletalesweb/services/shared_preferences_service.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

class HomeViewModel extends FutureViewModel<BuiltUser> {
  final _sharedPreferences = locator<SharedPreferencesService>();

  final _routerService = locator<RouterService>();

  late TabController tabController;

  void close() {
    _routerService.pop();
  }

  void showToast(
      {required ToastificationType type,
      required String title,
      required String description}) async {
    toastification.show(
      type: type,
      style: ToastificationStyle.minimal,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: kcPopMenuItem),
      ),
      description: description == ''
          ? null
          : Text(description,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kcPopMenuItem)),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  @override
  Future<BuiltUser> futureToRun() async => getUser();

  @override
  void onData(BuiltUser? data) {
    _sharedPreferences.saveUser(data!);
    super.onData(data);
  }

  Future<BuiltUser> getUser() async {
    return BuiltUser();
  }
}
