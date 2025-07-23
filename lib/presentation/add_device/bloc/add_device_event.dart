import 'package:equatable/equatable.dart';

abstract class AddDeviceEvent extends Equatable {
  const AddDeviceEvent();

  @override
  List<Object?> get props => [];
}

class DeviceNameChanged extends AddDeviceEvent {
  final String name;

  const DeviceNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class NotesChanged extends AddDeviceEvent {
  final String notes;

  const NotesChanged(this.notes);

  @override
  List<Object?> get props => [notes];
}

class DeviceTypeChanged extends AddDeviceEvent {
  final String type;

  const DeviceTypeChanged(this.type);

  @override
  List<Object?> get props => [type];
}

class RateChanged extends AddDeviceEvent {
  final String rate;

  const RateChanged(this.rate);

  @override
  List<Object?> get props => [rate];
}

class SubmitDevice extends AddDeviceEvent {}
