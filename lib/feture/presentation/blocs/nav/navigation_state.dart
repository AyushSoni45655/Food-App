part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}
final class NavigationToggleState extends NavigationState{
  final int cIndex;
  NavigationToggleState({required this.cIndex});
}