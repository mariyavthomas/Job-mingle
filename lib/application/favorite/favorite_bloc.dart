import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/fav_model.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/infrastructure/Repo/favorite.dart';


part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepo _favoriteRepo;

  FavoriteBloc(this._favoriteRepo) : super(FavoriteInitial()) {
    on<GetfavEvent>(_getfav);
    on<AddfavEvent>(_addfav);
    on<RemoveFavEvent>(_removeFav);
    on<SearchEvent>(_searchfav);
    on<IsFavoriteEvent>(_isFavorited);
  }

  FutureOr<void> _getfav(GetfavEvent event, Emitter<FavoriteState> emit) async {
        emit(FavoriteLoading());
    try {
     
      final favorites = await _favoriteRepo.getFavList();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(Favoriteerror(error: e.toString()));
    }
  }

  FutureOr<void> _addfav(AddfavEvent event, Emitter<FavoriteState> emit) async {
    try {
      await _favoriteRepo.addFavList(job: event.job,isFavorited: event.isFavorited);
    final favorites = await _favoriteRepo.getFavList();
    //  add(IsFavoriteEvent(jobuid:event.job.jobuid ));
      emit(FavoriteLoaded( favorites));
    } catch (e) {
      emit(Favoriteerror(error: e.toString()));
    }
  }

  FutureOr<void> _removeFav(RemoveFavEvent event, Emitter<FavoriteState> emit) async {
    try {
    
    // ignore: unused_local_variable
    final fav=  await _favoriteRepo.removeFav(event.favuid);
      
      emit(FavoriteInitial());
      //emit(FavoriteLoaded(fav!));
    } catch (e) {
      emit(Favoriteerror(error: e.toString()));
    }
  }

 Future<void> _searchfav(SearchEvent event, Emitter<FavoriteState> emit) async {
  emit(FavoriteLoading());
  try {
    if (event.searchQuery.isNotEmpty) {
      List<FavModel> data = await _favoriteRepo.searchFav(event.searchQuery);
      emit(FavoriteLoaded(data));
    } else {
      List<FavModel> data = await _favoriteRepo.getFavList();
      emit(FavoriteLoaded(data));
    }
  } catch (e) {
    emit(Favoriteerror(error: e.toString()));
  }
}


  FutureOr<void> _isFavorited(IsFavoriteEvent event, Emitter<FavoriteState> emit) async{
    try{
       // ignore: unused_local_variable
       final favorites = await _favoriteRepo.getFavList();
      final isfav= await _favoriteRepo.isInFav(event.jobuid);
      emit(IsFavoriteState(isfav));
    }catch(e){

    }
  }
}
