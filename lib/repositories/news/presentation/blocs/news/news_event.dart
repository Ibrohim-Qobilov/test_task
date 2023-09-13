part of 'news_bloc.dart';

class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNewsEvent extends NewsEvent {
  const GetNewsEvent();
}

class IsRead extends NewsEvent {
  final int index;
  const IsRead({required this.index});
}
