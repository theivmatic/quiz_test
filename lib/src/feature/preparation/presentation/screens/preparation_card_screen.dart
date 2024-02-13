import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/preparation/domain/bloc/preparation_bloc.dart';
import 'package:quiz_test/src/feature/preparation/presentation/widgets/preparation_tile.dart';
// import 'package:quiz_test/src/feature/preparation/presentation/widgets/small_facts.dart';

class PreparationCardScreen extends StatefulWidget {
  const PreparationCardScreen({super.key});

  @override
  State<PreparationCardScreen> createState() => _PreparationCardScreenState();
}

class _PreparationCardScreenState extends State<PreparationCardScreen> {
  late PreparationsBloc? preparationBloc;

  @override
  void initState() {
    preparationBloc = context.read<PreparationsBloc>()
      ..add(FetchPreparationsBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cлово пацана',
          style: TextStyles.appBarText,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.iconGrey,
        ),
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<PreparationsBloc, PreparationsBlocState>(
        bloc: preparationBloc,
        builder: (context, state) => switch (state) {
          PreparationsBlocLoadedState() => ListView.builder(
              itemCount: state.preparationsLoaded.facts?.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '30 фактов о сериале «Слово пацана. Кровь на асфальте»',
                          style: TextStyles.appBarText,
                        ),
                      ),
                      PreparationTileWidget(
                        number: state.preparationsLoaded.facts?[0].number,
                        text: state.preparationsLoaded.facts?[0].text,
                        imagePath:
                            state.preparationsLoaded.facts?[0].imagePath,
                        subtext: state.preparationsLoaded.facts?[0].subtext,
                      ),
                      
                      //TODO: разобраться как отрисовать здесь блок с фактами

                      // SmallFactsWidget(
                      //   title: state.preparationLoaded.subtitle,
                      //   itemCount: state.preparationLoaded.smallFacts!.length,
                      //   smallFact:
                      //       state.preparationLoaded.smallFacts?[index].text,
                      // ),
                    ],
                  );
                  // return Wrap(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 15),
                  //       child: Text(
                  //         '30 фактов о сериале «Слово пацана. Кровь на асфальте»',
                  //         style: TextStyles.appBarText,
                  //       ),
                  //     ),
                  //     PreparationTileWidget(
                  //       number: state.preparationLoaded.facts?[0].number,
                  //       text: state.preparationLoaded.facts?[0].text,
                  //       imagePath: state.preparationLoaded.facts?[0].imagePath,
                  //       subtext: state.preparationLoaded.facts?[0].subtext,
                  //     ),
                  //   ],
                  // );
                }
                return PreparationTileWidget(
                  number: state.preparationsLoaded.facts?[index].number,
                  text: state.preparationsLoaded.facts?[index].text,
                  imagePath: state.preparationsLoaded.facts?[index].imagePath,
                  subtext: state.preparationsLoaded.facts?[index].subtext,
                );
              },
            ),
          PreparationsBlocLoadingState() => const CircularProgressIndicator(),
          PreparationsBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}
