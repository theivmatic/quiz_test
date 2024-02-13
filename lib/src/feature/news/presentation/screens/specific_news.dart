import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/news/domain/bloc/news_bloc.dart';
import 'package:quiz_test/src/feature/news/domain/models/news_entity.dart';
import 'package:quiz_test/src/feature/news/presentation/widgets/news_tile.dart';

class SpecificNewsScreen extends StatefulWidget {
  final News? news;

  const SpecificNewsScreen({
    super.key,
    required this.news,
  });

  @override
  State<SpecificNewsScreen> createState() => _SpecificNewsScreenState();
}

class _SpecificNewsScreenState extends State<SpecificNewsScreen> {
  late NewsBloc? newsBloc;

  @override
  void initState() {
    newsBloc = context.read<NewsBloc>()..add(FetchNewsBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.iconGrey,
        ),
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<NewsBloc, NewsBlocState>(
        bloc: newsBloc,
        builder: (context, state) => switch (state) {
          NewsBlocLoadedState() => Container(
              decoration: BoxDecoration(
                color: AppColors.popupMenuBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.builder(
                itemCount: state.newsLoaded.news?.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Text(
                            'Новые «Бременские музыканты»: фантазия с эффектом «зловещей долины»',
                            style: TextStyles.appBarText,
                          ),
                        ),
                        // NewsTileWidget(
                        //   newsTitle: state.newsLoaded.news?[0].newsTitle,
                        //   newsText: state.newsLoaded.news?[0].newsText,
                        //   imagePath: state.newsLoaded.news?[0].imagePath,
                        //   newsSubtext: state.newsLoaded.news?[0].newsSubtext,
                        // ),
                      ],
                    );
                  }
                  // return NewsTileWidget(
                  //   newsTitle: state.newsLoaded.news?[index].newsTitle,
                  //   newsText: state.newsLoaded.news?[index].newsText,
                  //   imagePath: state.newsLoaded.news?[index].imagePath,
                  //   newsSubtext: state.newsLoaded.news?[index].newsSubtext,
                  // );
                },
              ),
            ),
          NewsBlocLoadingState() => const CircularProgressIndicator(),
          NewsBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}
