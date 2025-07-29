import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'machines_state_handler.dart';

class MachinesViewModel extends StateNotifier<MachinesStateHandler> {
  MachinesViewModel() : super(const MachinesStateHandler());

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> fetchMachines() async {
    setLoading(true);
    try {
      // Simulate fetching
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      setLoading(false);
    }
  }
}
