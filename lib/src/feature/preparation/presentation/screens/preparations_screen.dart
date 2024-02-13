import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/preparation/domain/bloc/preparation_bloc.dart';
import 'package:quiz_test/src/feature/preparation/presentation/screens/preparation_screen.dart';
import 'package:quiz_test/src/feature/preparation/presentation/widgets/preparation_card.dart';

class PreparationsScreen extends StatefulWidget {
  const PreparationsScreen({super.key});

  @override
  State<PreparationsScreen> createState() => _PreparationsScreenState();
}

class _PreparationsScreenState extends State<PreparationsScreen> {
  late PreparationsBloc? preparationsBloc;

  @override
  void initState() {
    preparationsBloc = context.read<PreparationsBloc>()
      ..add(FetchPreparationsBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Подготовка',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<PreparationsBloc, PreparationsBlocState>(
        bloc: preparationsBloc,
        builder: (context, state) => switch (state) {
          PreparationsBlocLoadedState() => GridView.builder(
            itemCount: state.preparationsLoaded.preparations?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return PreparationCardWidget(
                  title: state
                      .preparationsLoaded.preparations?[index].preparationName,
                  subtitle: state.preparationsLoaded.preparations?[index].title,
                  imagePath:
                      state.preparationsLoaded.preparations?[index].imagePath,
                  onCardTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (context) => PreparationScreen(
                          preparation:
                              state.preparationsLoaded.preparations?[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          PreparationsBlocLoadingState() => const CircularProgressIndicator(),
          PreparationsBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),

      // GridView.count(
      //   crossAxisCount: 2,
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute<dynamic>(
      //             builder: (context) => const PreparationScreen(),
      //           ),
      //         );
      //       },
      //       child: Image.asset(
      //         'assets/images/card_topic.png',
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
