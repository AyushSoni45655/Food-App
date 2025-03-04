part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}
 class NavigationToggleEvent extends NavigationEvent{
  final int index;
  NavigationToggleEvent({required this.index});
}
