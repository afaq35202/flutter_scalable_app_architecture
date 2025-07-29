import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'machines_state_handler.dart';
import 'machines_view_model.dart';

final machinesViewModelProvider =
    StateNotifierProvider.autoDispose<MachinesViewModel, MachinesStateHandler>(
      (ref) => MachinesViewModel(),
    );
