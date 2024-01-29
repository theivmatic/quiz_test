import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/domain/databases/training_database.dart';
import 'package:quiz_test/src/feature/presentation/bloc/training/training_bloc.dart';
import 'package:quiz_test/src/feature/presentation/screens/error_screen.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новости',
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: BlocBuilder<TrainingBloc, TrainingBlocState>(
        builder: (context, state) {
          if (state is TrainingBlocInitialState) {
            context.read<TrainingBloc>().add(const FetchTrainingEvent());
          }
          if (state is DisplayTraining) {
            if (state.training.isEmpty) {
              TrainingDatabase.instance.addJson();
            } else {
              return Placeholder();
            }
          }
          return const ErrorScreen();
        },
      ),
    );
  }
}
