import 'package:flutter/material.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
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
      body: ListView.builder(
        itemCount: widget.news?.items?.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    widget.news?.title ?? '',
                    style: TextStyles.appBarText,
                  ),
                ),
                NewsTileWidget(
                  newsTitle: widget.news?.items?[index].title,
                  newsText: widget.news?.items?[index].text,
                  imagePath: widget.news?.items?[index].imagePath,
                  newsSubtext: widget.news?.items?[index].subtext,
                ),
              ],
            );
          }
          return NewsTileWidget(
            newsTitle: widget.news?.items?[index].title,
            newsText: widget.news?.items?[index].text,
            imagePath: widget.news?.items?[index].imagePath,
            newsSubtext: widget.news?.items?[index].subtext,
          );
        },
      ),
    );
  }
}
