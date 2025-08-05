import '../constants/enums/app_client.dart';
import '../constants/enums/user_role.dart';

class AppConfig {
  final UserRole role;
  final AppClient client;

  const AppConfig({required this.role, required this.client});
}
