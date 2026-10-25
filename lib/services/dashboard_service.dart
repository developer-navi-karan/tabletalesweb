import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_user.dart';
import 'package:tabletalesweb/services/dashboard_service_interface.dart';
import 'package:tabletalesweb/services/supabase_service.dart';

class DashboardService extends DashboardServiceInterface {
  final _supabaseService = locator<SupabaseService>();

  @override
  Future<List<BuiltUser?>> getAllUsers() async {
    final data = await _supabaseService.supabaseDb.from('users').select();
    return data
        .map((element) =>
            BuiltUser.fromJson(jsonEncode(sanitizeForJson(element))))
        .toList();
  }

  dynamic sanitizeForJson(dynamic value) {
    if (value is DateTime) {
      return DateFormat('yyyy-MM-dd')
          .parse(value.toIso8601String())
          .toIso8601String();
    } else if (value is Map<String, dynamic>) {
      return value.map((k, v) => MapEntry(k, sanitizeForJson(v)));
    } else if (value is List) {
      return value.map(sanitizeForJson).toList();
    } else {
      return value;
    }
  }
}
