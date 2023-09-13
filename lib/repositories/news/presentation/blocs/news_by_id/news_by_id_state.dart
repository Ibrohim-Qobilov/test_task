part of 'news_by_id_bloc.dart';

class NewsByIdState extends Equatable {
  const NewsByIdState();

  @override
  List<Object> get props => [];
}

class NewsByIdInitial extends NewsByIdState {}

class NewsByIdLoading extends NewsByIdState {}
class NewsByIdError extends NewsByIdState {}
class NewsByIdNetwork extends NewsByIdState {}

class NewsLoadedByID extends NewsByIdState {
  final Article data;
  const NewsLoadedByID(this.data);
}
