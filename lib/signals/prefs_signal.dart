import 'package:be_safe3/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';

final prefsSignal = computed<SharedPreferences>(() {
  throw UnimplementedError();
});
final userModelSignal = signal<UserModel?>(null);
