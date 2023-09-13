import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

part 'news_by_id_event.dart';
part 'news_by_id_state.dart';

class NewsByIdBloc extends Bloc<NewsByIdEvent, NewsByIdState> {
  MockNewsRepository? repository = MockNewsRepository();
  NewsByIdBloc() : super(NewsByIdInitial()) {
    on<GetNewsByIdEvent>(_getNewsById);
  }
  FutureOr<void> _getNewsById(GetNewsByIdEvent event, emit) async {
    try {
      emit(NewsByIdLoading());

      final mList = await repository!.getArticle(id: event.id!);
      emit(NewsLoadedByID(mList));
    } on SocketException {
      emit(NewsByIdNetwork());
    } catch (ee) {
      emit(NewsByIdError());
    }
  }
}
