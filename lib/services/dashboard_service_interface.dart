import 'package:tabletalesweb/data/model/built_user.dart';

abstract class DashboardServiceInterface {
  Future<List<BuiltUser?>> getAllUsers();
}
