import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabletalesweb/data/model/built_user.dart';
import 'package:tabletalesweb/ui/common/app_constants.dart';

class SharedPreferencesService {
  late SharedPreferences preferences;

  SharedPreferencesService() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }

  @override
  Future<bool> clear() {
    return preferences.clear();
  }

  @override
  Future<String?> getUser() async {
    return preferences.getString(ksPreferenceUser);
  }

  @override
  Future<bool> saveUser(BuiltUser builtUser) {
    return preferences.setString(ksPreferenceUser, builtUser.toJson());
  }
}
