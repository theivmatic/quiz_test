import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/presentation/bloc/notes/notes_bloc.dart';
import 'package:quiz_test/src/feature/presentation/bloc/observer.dart';
import 'package:quiz_test/src/feature/presentation/bloc/preparation/preparation_bloc.dart';
import 'package:quiz_test/src/feature/presentation/screens/splash_screen.dart';

void main() {
  Bloc.observer = AppObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
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
          create: (context) => PreparationBloc(),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
