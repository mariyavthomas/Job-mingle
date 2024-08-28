part of 'favorite_bloc.dart';

// ignore: must_be_immutable
sealed class FavoriteState extends Equatable {
  bool ? isFav;
   FavoriteState({this.isFav});
  
  @override
  List<Object> get props => [isFav!];
}

// ignore: must_be_immutable
final class FavoriteInitial extends FavoriteState {
  FavoriteInitial() :super(isFav: false);
}

// ignore: must_be_immutable
class FavoriteLoading extends FavoriteState{}

// ignore: must_be_immutable
class FavoriteLoaded extends FavoriteState{
  final List<FavModel ?> fav;
  FavoriteLoaded(this.fav);
   @override
  List<Object> get props => [fav];
}
// ignore: must_be_immutable
class Favoriteerror extends FavoriteState{
final  String error;
Favoriteerror({required this.error});

}
// ignore: must_be_immutable
class IsFavoriteState extends FavoriteState{
  final bool isFav;
  IsFavoriteState(this.isFav);
}