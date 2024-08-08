import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/infrastructure/Repo/alljobrepo.dart';
import 'package:jobmingle/infrastructure/Repo/filterrepo.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterallEvent>(_filterjobname);
  }

  FutureOr<void> _filterjobname(
      FilterallEvent event, Emitter<FilterState> emit) async {
    emit(FilterLoading());
    try {
      List<JobModel> data = await FilterRepo().filterjobtitle();
      print(data.length);
      emit(FilterSuccessState(filterjob: data));
    } catch (e) {}
  }
}
