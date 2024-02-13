import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/preparation/domain/models/preparations_entity.dart';
import 'package:quiz_test/src/feature/preparation/presentation/widgets/preparation_tile.dart';
// import 'package:quiz_test/src/feature/preparation/presentation/widgets/small_facts.dart';

class PreparationScreen extends StatefulWidget {
  final Preparation? preparation;

  const PreparationScreen({
    super.key,
    required this.preparation,
  });

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.preparation?.preparationName ?? '',
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
      body: ListView.builder(
        //TODO: сделать норм итемкаунт
        itemCount: 7,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.preparation?.title ?? '',
                    style: TextStyles.appBarText,
                  ),
                ),
                PreparationTileWidget(
                  number: widget.preparation?.facts?[index].number,
                  text: widget.preparation?.facts?[index].text,
                  imagePath: widget.preparation?.facts?[index].imagePath,
                  subtext: widget.preparation?.facts?[index].subtext,
                ),
              ],
            );
          }
          return PreparationTileWidget(
            number: widget.preparation?.facts?[index].number,
            text: widget.preparation?.facts?[index].text,
            imagePath: widget.preparation?.facts?[index].imagePath,
            subtext: widget.preparation?.facts?[index].subtext,
          );
        },
      ),
    );
  }
}



      

      //TODO: разобраться как отрисовать здесь блок с фактами

      // SmallFactsWidget(
      //   title: state.preparationLoaded.subtitle,
      //   itemCount: state.preparationLoaded.smallFacts!.length,
      //   smallFact:
      //       state.preparationLoaded.smallFacts?[index].text,
      // ),
      //   ],
      // );
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
      //     }
      //     return PreparationTileWidget(
      //       number: state.preparationsLoaded.facts?[index].number,
      //       text: state.preparationsLoaded.facts?[index].text,
      //       imagePath: state.preparationsLoaded.facts?[index].imagePath,
      //       subtext: state.preparationsLoaded.facts?[index].subtext,
      //     );
      //   },
      // ),
//     );
//   }
// }
