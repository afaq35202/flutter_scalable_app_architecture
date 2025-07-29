import 'package:dobby/shared/widgets/clickables/reusable_button.dart';
import 'package:dobby/shared/widgets/scaffold/export_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/machines_provider.dart';

class MachinesMobile extends ConsumerWidget {
  const MachinesMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReusableScaffold(
      appBar: ReusableAppBar(),
      body: ReusableBody(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
