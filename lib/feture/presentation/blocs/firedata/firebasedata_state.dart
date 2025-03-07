part of 'firebasedata_bloc.dart';

@immutable
sealed class FirebaseDataState {}

final class FirebaseDataInitial extends FirebaseDataState {}
final class FirebaseDataLoading extends FirebaseDataState {}
final class FirebaseDataError extends FirebaseDataState {
  final String error;
  FirebaseDataError({required this.error});
}
final class FirebaseDataLoaded extends FirebaseDataState {
  final List<Categoryss>category;
  FirebaseDataLoaded({required this.category});
}
final class FirebaseCategoryDataLoaded extends FirebaseDataState {
  final List<CategoryData>categoryData;
  final List<Categoryss> categoryList;
  FirebaseCategoryDataLoaded({required this.categoryData,required this.categoryList});
}

