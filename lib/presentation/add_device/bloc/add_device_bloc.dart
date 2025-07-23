import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playstation_store/service/storage/device_id_storage.dart';
import 'add_device_event.dart';
import 'add_device_state.dart';
import 'package:playstation_store/core/model/device_model.dart';

class AddDeviceBloc extends Bloc<AddDeviceEvent, AddDeviceState> {
  AddDeviceBloc() : super(const AddDeviceState()) {
    on<DeviceNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<NotesChanged>((event, emit) {
      emit(state.copyWith(notes: event.notes));
    });

    on<DeviceTypeChanged>((event, emit) {
      emit(state.copyWith(type: event.type));
    });

    on<RateChanged>((event, emit) {
      emit(state.copyWith(rate: event.rate));
    });

    on<SubmitDevice>((event, emit) async {
      if (state.name.isEmpty || state.rate.isEmpty) return;

      emit(state.copyWith(isSubmitting: true));

      await Future.delayed(const Duration(milliseconds: 300));
      final nextId = await DeviceIdStorageService.getNextId();
      final device = DeviceModel(
        id: nextId.toString(),
        name: state.name.trim(),
        notes: state.notes.trim(),
        type: state.type,
        rate: state.rate.trim(),
        sessions: [],
      );
      final devices = await DeviceStorageService.loadDevices();
      devices.add(device);
      await DeviceStorageService.saveDevices(devices);
    });
  }
}
