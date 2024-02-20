import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_test/src/core/constants/app_theme.dart';
import 'package:quiz_test/src/feature/preparation/domain/models/preparations_entity.dart';
import 'package:quiz_test/src/feature/preparation/presentation/widgets/preparation_tile.dart';

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
        itemCount: widget.preparation?.facts?.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
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
