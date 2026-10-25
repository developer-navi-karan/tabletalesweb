import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_user.dart';
import 'package:tabletalesweb/services/dashboard_service.dart';

class DashboardViewModel extends FutureViewModel<List<BuiltUser?>> {
  final _dashboardService = locator<DashboardService>();

  Future<List<BuiltUser?>> getAllUsers() async =>
      _dashboardService.getAllUsers();

  @override
  Future<List<BuiltUser?>> futureToRun() => getAllUsers();
}
