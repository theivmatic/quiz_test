import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/core/screens/error_screen.dart';
import 'package:quiz_test/src/feature/news/domain/bloc/news_bloc.dart';
import 'package:quiz_test/src/feature/news/presentation/screens/specific_news.dart';
import 'package:quiz_test/src/feature/news/presentation/widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
        title: Text(
          'Новости',
          style: TextStyles.appBarText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground,
      ),
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder(
        bloc: newsBloc,
        builder: (context, state) => switch (state) {
          NewsBlocLoadedState() => ListView.builder(
              itemCount: state.newsLoaded.news?.length,
              itemBuilder: (context, index) {
                return NewsCardWidget(
                  title: state.newsLoaded.news?[index].title,
                  imagePath: state.newsLoaded.news?[index].imagePath,
                  date: state.newsLoaded.news?[index].date,
                  timeToRead: state.newsLoaded.news?[index].timeToRead,
                  onCardTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<dynamic>(
                        builder: (context) => SpecificNewsScreen(
                          news: state.newsLoaded.news?[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          NewsBlocLoadingState() => const CircularProgressIndicator(),
          NewsBlocErrorState() => const ErrorScreen(),
          _ => const Placeholder(),
        },
      ),

      // Column(
      //   children: [
      //     NewsTileWidget(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute<dynamic>(
      //             builder: (context) => const SpecificNewsScreen(),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
