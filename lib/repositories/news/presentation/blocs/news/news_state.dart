part of 'news_bloc.dart';

class NewsState extends Equatable {
  final List<Article> data;
  const NewsState({required this.data});

  @override
  List<Object> get props => [data];
}

class NewsInitial extends NewsState {
  NewsInitial() : super(data: []);
}

class NewsLoading extends NewsState {
  NewsLoading() : super(data: []);
}

class NewsLoaded extends NewsState {
  @override
  final List<Article> data;
  const NewsLoaded({required this.data}) : super(data: data);
}

class NewsError extends NewsState {
  const NewsError() : super(data: const []);
}
