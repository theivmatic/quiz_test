import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/news/domain/bloc/news_bloc.dart';
import 'package:quiz_test/src/feature/news/screens/news_screen.dart';
import 'package:quiz_test/src/feature/news/widgets/news_card.dart';

class SpecificNewsScreen extends StatefulWidget {
  const SpecificNewsScreen({super.key});

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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const NewsScreen()));
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
                itemBuilder: (context, index) => NewsCardWidget(
                  newsTitle: state.newsLoaded.news?[index].newsTitle,
                  newsText: state.newsLoaded.news?[index].newsText,
                  imagePath: state.newsLoaded.news?[index].imagePath,
                  newsSubtext: state.newsLoaded.news?[index].newsSubtext,
                ),
              ),
            ),
          NewsBlocLoadingState() => const Placeholder(),
          NewsBlocErrorState() => const Placeholder(),
          _ => const Placeholder(),
        },
      ),
    );
  }
}
