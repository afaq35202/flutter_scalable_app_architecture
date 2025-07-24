import 'package:dobby/core/extensions/string_extensions.dart';
import 'package:dobby/shared/widgets/scaffold/export_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/reusable_linear_progress_loader.dart';
import '../view_model/app_initializer_provider.dart';

class AppInitializerMobile extends ConsumerWidget {
  const AppInitializerMobile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ReusableScaffold(
      body: ReusableBody(
        child: Column(
          children: [
            Spacer(flex: 2),
            Center(child: ReusableLinearProgressLoader(height: 10, width: 100)),
            ElevatedButton(onPressed: (){
              ref.read(appInitializerProvider.notifier).fetchItems();
            }, child: Text("Change translations")),
            Consumer(
              builder: (context, ref, _) {
                final reference = ref.watch(appInitializerProvider);
                return reference.isLoading
                    ? CircularProgressIndicator()
                    : Text("info".tr(ref));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
