import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test/src/feature/presentation/bloc/preparation/preparation_bloc.dart';
import 'package:quiz_test/src/feature/presentation/screens/preparations_screen.dart';

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
          style: GoogleFonts.robotoFlex(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PreparationsScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      ),
      backgroundColor: const Color.fromRGBO(27, 31, 41, 1),
      body: BlocBuilder<PreparationBloc, PreparationBlocState>(
        bloc: preparationBloc,
        builder: (context, state) => switch (state) {
          PreparationBlocLoadedState() => ListView.builder(
              itemCount: state.preparationLoaded.facts!.length,
              itemBuilder: (context, index) => PreparationTileWidget(
                number: state.preparationLoaded.facts![index].number!,
                text: state.preparationLoaded.facts![index].text!,
                imagePath: state.preparationLoaded.facts![index].imagePath!,
                subtext: state.preparationLoaded.facts![index].subtext!,
              ),
            ),
          PreparationBlocLoadingState() => const Placeholder(),
          PreparationBlocErrorState() => const Placeholder(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}

class PreparationTileWidget extends StatelessWidget {
  final String number;
  final String text;
  final String? imagePath;
  final String? subtext;

  const PreparationTileWidget({
    super.key,
    required this.number,
    required this.text,
    this.imagePath,
    this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number),
        Text(text),
        Image.asset(imagePath!),
        Text(subtext!),
      ],
    );
  }
}
