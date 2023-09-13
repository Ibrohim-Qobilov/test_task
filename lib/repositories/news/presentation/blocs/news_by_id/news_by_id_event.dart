part of 'news_by_id_bloc.dart';

class NewsByIdEvent extends Equatable {
  const NewsByIdEvent();

  @override
  List<Object> get props => [];
}


class GetNewsByIdEvent extends NewsByIdEvent {
  final String? id;
  const GetNewsByIdEvent({this.id});
}