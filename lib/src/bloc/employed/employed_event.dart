part of 'employed_bloc.dart';

@immutable
abstract class EmployedEvent{}

class GetEmployes extends EmployedEvent{
  final String status;
  GetEmployes({this.status});
}