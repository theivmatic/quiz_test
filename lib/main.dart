import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/bloc/observer.dart';
import 'package:quiz_test/src/core/router/navigation_screen.dart';
// import 'package:quiz_test/src/core/screens/splash_screen.dart';
// import 'package:quiz_test/src/core/screens/start_screen.dart';
import 'package:quiz_test/src/feature/news/domain/bloc/news_bloc.dart';
import 'package:quiz_test/src/feature/notes/domain/bloc/notes_bloc.dart';
import 'package:quiz_test/src/feature/preparation/domain/bloc/preparation_bloc.dart';
import 'package:quiz_test/src/feature/quiz/domain/bloc/quiz_bloc.dart';

void main() {
  Bloc.observer = AppObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesBloc(),
        ),
        BlocProvider(
          create: (context) => PreparationsBloc(),
        ),
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
        BlocProvider(
          create: (context) => QuizzesBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: const NavigationScreen(),
        ),
      ),
    );
  }
}
