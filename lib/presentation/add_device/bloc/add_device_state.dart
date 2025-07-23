import 'package:equatable/equatable.dart';
import 'package:playstation_store/core/model/device_model.dart';

class AddDeviceState extends Equatable {
  final String name;
  final String notes;
  final String type;
  final String rate;
  final bool isSubmitting;

  const AddDeviceState({
    this.name = '',
    this.notes = '',
    this.type = 'ps4',
    this.rate = '',
    this.isSubmitting = false,
  });

  AddDeviceState copyWith({
    String? name,
    String? notes,
    String? type,
    String? rate,
    bool? isSubmitting,
  }) {
    return AddDeviceState(
      name: name ?? this.name,
      notes: notes ?? this.notes,
      type: type ?? this.type,
      rate: rate ?? this.rate,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [name, notes, type, rate, isSubmitting];
}
