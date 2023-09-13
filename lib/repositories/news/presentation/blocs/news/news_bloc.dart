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
    on<IsRead>(_getIsRead);
  }

  FutureOr<void> _getNews(GetNewsEvent event, emit) async {
    try {
      emit(NewsLoading());

      final List<Article> mList = await repository!.getLatestArticles();

      emit(NewsLoaded(data: mList));
    } on SocketException {
    } catch (ee) {
      emit(const NewsError());
    }
  }

  FutureOr<void> _getIsRead(IsRead event, emit) async {
    try {
      print('try');
      // emit(NewsLoading());

      final List<Article> mList = state.data;
      mList[event.index] = mList[event.index].copyWith(readed: true);
      emit(NewsLoaded(data: mList));
    } on SocketException {
    } catch (ee) {
      print('error: ${ee}');
      emit(const NewsError());
    }
  }
}
