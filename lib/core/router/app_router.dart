import 'package:go_router/go_router.dart';
import '../../presentation/pages/main_page.dart';
import '../../presentation/pages/saved_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/saved',
      builder: (context, state) => const SavedPage(),
    ),
  ],
); 