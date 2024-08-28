// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable

part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}
class GetfavEvent extends FavoriteEvent{}

class AddfavEvent extends FavoriteEvent{
  JobModel job;
  final String useruid;
   bool isFavorited;
  
  AddfavEvent({required this.job,required this.useruid,required  this.isFavorited});
   @override
  List<Object> get props => [job];
}

class RemoveFavEvent extends FavoriteEvent{
  final String favuid;
  RemoveFavEvent({required this.favuid});
   @override
  List<Object> get props => [];
}


class IsFavoriteEvent extends FavoriteEvent{
 final String jobuid;
  IsFavoriteEvent( {required this.jobuid});
  @override
  List<Object> get props => [jobuid];
} 

class SearchEvent extends FavoriteEvent{
  String searchQuery;
  SearchEvent({required this.searchQuery});
   @override
  List<Object> get props => [searchQuery];
}