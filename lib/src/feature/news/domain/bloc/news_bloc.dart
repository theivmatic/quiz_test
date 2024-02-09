import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/src/feature/news/data/fetch_news.dart';
import 'package:quiz_test/src/feature/news/domain/models/news_entity/news_entity.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  NewsBloc() : super(NewsBlocInitialState()) {
    on<FetchNewsBlocEvent>((event, emit) async {
      try {
        final newsLoaded = await fetchNews();
        emit(NewsBlocLoadedState(newsLoaded: newsLoaded));
      } on Exception catch (e) {
        emit(NewsBlocErrorState(errorMessage: e.toString()));
      }
    });
  }
}
