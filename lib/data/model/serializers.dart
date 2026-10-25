import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tabletalesweb/data/model/built_country.dart';
import 'package:tabletalesweb/data/model/built_quiz.dart';
import 'package:tabletalesweb/data/model/built_table.dart';
import 'package:tabletalesweb/data/model/built_table_row.dart';
import 'package:tabletalesweb/data/model/built_user.dart';

part 'serializers.g.dart';

@SerializersFor([BuiltCountry, BuiltUser, BuiltTable, BuiltTableRow, BuiltQuiz])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
