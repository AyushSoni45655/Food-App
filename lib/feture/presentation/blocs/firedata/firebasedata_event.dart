part of 'firebasedata_bloc.dart';

@immutable
sealed class FirebaseDataEvent {}
class FirebaseCategoryEvent extends FirebaseDataEvent{}
class FirebaseCategoryDataEvent extends FirebaseDataEvent{
  final String id;
  FirebaseCategoryDataEvent({required this.id});
}