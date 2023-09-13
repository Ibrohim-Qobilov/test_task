import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  MockNewsRepository? repository = MockNewsRepository();
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsEvent>(_getNews);
  }

  FutureOr<void> _getNews(GetNewsEvent event, emit) async {
    try {
      emit(NewsLoading());

      final List<Article> mList = await repository!.getLatestArticles();
      emit(NewsLoaded(mList));
    } on SocketException {
      emit(NewsNetwork());
    } catch (ee) {
      emit(const NewsError());
    }
  }
}
