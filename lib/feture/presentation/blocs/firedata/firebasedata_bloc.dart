import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:food_application/feture/domain/entity/category.dart';
import 'package:food_application/feture/domain/entity/categorydata.dart';
import 'package:food_application/feture/domain/use_case/category_usecase.dart';
import 'package:food_application/feture/domain/use_case/categorydata_usecase.dart';
import 'package:meta/meta.dart';

part 'firebasedata_event.dart';
part 'firebasedata_state.dart';

class FirebaseDataBloc extends Bloc<FirebaseDataEvent, FirebaseDataState> {
  final CategoryUseCase categoryUseCase;
  final CategoryDataUseCase categoryDataUseCase;
  FirebaseDataBloc({required this.categoryUseCase,required this.categoryDataUseCase})
    : super(FirebaseDataInitial()) {
    on<FirebaseCategoryEvent>((event, emit) async {
      emit(FirebaseDataLoading());
      final data = await categoryUseCase.call();
      data.fold(
        (l) => emit(FirebaseDataError(error: l.toString())),
        (categorysss) => emit(FirebaseDataLoaded(category: categorysss)),
      );
    });
    on<FirebaseCategoryDataEvent>((event, emit) async{
      final currentState = state;  // ✅ पहले का state check करें
      List<Categoryss> categoryList = [];

      if (currentState is FirebaseDataLoaded) {
        categoryList = currentState.category;
      } else if (currentState is FirebaseCategoryDataLoaded) {
        categoryList = currentState.categoryList;
      }
      emit(FirebaseDataLoading());
      final data = await categoryDataUseCase.call(event.id);
      data.fold((l) => emit(FirebaseDataError(error: l.toString())),
            (r) => emit(FirebaseCategoryDataLoaded(categoryData: r,categoryList: categoryList)),
      );
    },);
  }
}
