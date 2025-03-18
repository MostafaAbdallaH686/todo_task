import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';

import 'package:to_do_app/features/home/data/repo/home_repo.dart';
import 'package:to_do_app/features/home/manager/home_cubit.dart/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    name =
        cacheHelper.getDataString(key: SharedPrefereneceKey.username) as String;
    getAllTasks();
    image = cacheHelper.getDataString(key: SharedPrefereneceKey.imagepath);
    log(image ?? "Image Null");
  }
  static HomeCubit get(context) => BlocProvider.of(context);
  Helper cacheHelper = Helper();
  HomeRepo homeRepo = HomeRepo();
  late String name;
  late String? image;

  void getAllTasks() async {
    emit(HomeLoadingState());
    var response = await homeRepo.getTasks();

    response.fold((error) => emit(HomeErrorState(errMessage: error)), (list) {
      if (list.isEmpty) {
        emit(HomeSuccessNoDataState());
      } else {
        emit(HomeSuccessState(tasks: list));
      }
    });
  }
}
