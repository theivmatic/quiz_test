import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/preparation/domain/bloc/preparation_bloc.dart';
import 'package:quiz_test/src/feature/preparation/presentation/screens/preparations_screen.dart';
import 'package:quiz_test/src/feature/preparation/presentation/widgets/preparation_tile.dart';


class PreparationCardScreen extends StatefulWidget {
  const PreparationCardScreen({super.key});

  @override
  State<PreparationCardScreen> createState() => _PreparationCardScreenState();
}

class _PreparationCardScreenState extends State<PreparationCardScreen> {
  late PreparationBloc? preparationBloc;

  @override
  void initState() {
    preparationBloc = context.read<PreparationBloc>()
      ..add(FetchPreparationBlocEvent());
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PreparationsScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<PreparationBloc, PreparationBlocState>(
        bloc: preparationBloc,
        builder: (context, state) => switch (state) {
          PreparationBlocLoadedState() => ListView.builder(
              itemCount: state.preparationLoaded.facts?.length,
              itemBuilder: (context, index) => PreparationTileWidget(
                number: state.preparationLoaded.facts?[index].number,
                text: state.preparationLoaded.facts?[index].text,
                imagePath: state.preparationLoaded.facts?[index].imagePath,
                subtext: state.preparationLoaded.facts?[index].subtext,
              ),
            ),
          PreparationBlocLoadingState() => const CircularProgressIndicator(),
          PreparationBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}

