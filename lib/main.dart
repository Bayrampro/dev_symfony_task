import 'package:dev_symfony_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/di.dart';
import 'core/router/app_router.dart';
import 'presentation/bloc/number_info_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberInfoBloc>(),
      child: MaterialApp.router(
        title: 'Numbers Info',
        theme: appTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
