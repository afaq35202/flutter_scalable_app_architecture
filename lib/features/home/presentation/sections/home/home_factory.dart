import 'package:dobby/core/constants/enums/app_client.dart';
import 'package:dobby/core/constants/enums/user_role.dart';
import 'package:dobby/core/provider/global_providers.dart';

import 'base/home_section.dart';
import 'roles/technician_home.dart';
import 'roles/supervisor_home.dart';
import 'clients/yellowbeard/technician_home_yellowbeard.dart';
import 'clients/dankoff/technician_home_dankoff.dart';

final _appConfig = GlobalProviders.instance.read(
  GlobalProviders.appConfigProvider,
);

HomeSection get getHomeSection {
  HomeSection base = DefaultHome();

  final role = _appConfig.role;
  final client = _appConfig.client;

  if (role == UserRole.technician) {
    switch (client) {
      case AppClient.yellowbeard:
        return TechnicianHomeYellowbeard(base);
      case AppClient.dankoff:
        return TechnicianHomeDankoff(base);
      default:
        return TechnicianHome(base);
    }
  } else if (role == UserRole.supervisor) {
    return SupervisorHome(base);
  }

  return base;
}
