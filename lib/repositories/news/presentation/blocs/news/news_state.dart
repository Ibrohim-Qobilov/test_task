part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> data;
  const NewsLoaded(this.data);
}



class NewsError extends NewsState {
  final String? error;
  const NewsError({this.error});
}

class NewsNetwork extends NewsState {}
