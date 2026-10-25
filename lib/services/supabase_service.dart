import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseClient get supabaseClient => Supabase.instance.client;

  GoTrueClient get supabaseAuth => Supabase.instance.client.auth;

  SupabaseStorageClient get supabaseStorage => Supabase.instance.client.storage;

  FunctionsClient get supabaseFunctions => Supabase.instance.client.functions;

  PostgrestClient get supabaseDb => Supabase.instance.client.rest;

  /// Reads `users.is_subscribed` for the current user. Anything other than a
  /// confirmed `true` (logged out, missing row/column, network error) counts
  /// as not subscribed, so paid content stays locked.
  Future<bool> isSubscribed() async {
    final user = supabaseAuth.currentUser;
    if (user == null) return false;
    try {
      final row = await supabaseClient
          .from('users')
          .select('is_subscribed')
          .eq('user_id', user.id)
          .maybeSingle();
      return row?['is_subscribed'] == true;
    } on PostgrestException {
      return false;
    }
  }
}
