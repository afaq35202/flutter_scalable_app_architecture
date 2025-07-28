import 'package:yellowrock/features/home/presentation/home_page.dart';
import 'package:yellowrock/shared/widgets/scaffold/export_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/reusable_linear_progress_loader.dart';
import '../view_model/app_initializer_provider.dart';

class AppInitializerMobile extends ConsumerStatefulWidget {
  const AppInitializerMobile({super.key});

  @override
  ConsumerState<AppInitializerMobile> createState() =>
      _AppInitializerMobileState();
}

class _AppInitializerMobileState extends ConsumerState<AppInitializerMobile> {
  late final ProviderSubscription _subscription;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    // Listen manually (this is the correct way in initState)
    _subscription = ref.listenManual<AsyncValue<void>>(appInitializerProvider, (
      prev,
      next,
    ) {
      next.whenOrNull(
        data: (_) {
          if (_navigated) return; // 🔒 already navigated
          _navigated = true;
          Future.microtask(() {
            if (!mounted) return;
            context.go(HomePage.routeName);
          });
        },
      );
    });
  }

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      body: ReusableBody(child: ReusableLinearProgressLoader()),
    );
  }
}
