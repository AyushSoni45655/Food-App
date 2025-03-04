part of 'password_bloc.dart';

@immutable
sealed class PasswordState {}

final class PasswordInitial extends PasswordState {}
final class PasswordToggleState extends PasswordState{
  final bool obscure;
  PasswordToggleState({required this.obscure});
}