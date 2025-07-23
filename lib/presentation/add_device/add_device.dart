// presentation/add_device.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playstation_store/core/model/device_model.dart';
import 'package:playstation_store/presentation/add_device/bloc/add_device_bloc.dart';
import 'package:playstation_store/presentation/add_device/bloc/add_device_event.dart';
import 'package:playstation_store/presentation/add_device/bloc/add_device_state.dart';
import 'package:playstation_store/service/storage/device_id_storage.dart';
import 'package:playstation_store/widget/custom_button.dart';
import 'package:playstation_store/widget/custom_text_field.dart';
import 'package:playstation_store/widget/select_playstation.dart';

class AddDevice extends StatelessWidget {
  final nameController = TextEditingController();
  final notesController = TextEditingController();
  final rateController = TextEditingController();
  String selectedType = 'ps4';

  AddDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => GoRouter.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new, size: 18),
        ),
        title: const Text("Add New Device"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AddDeviceBloc(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocConsumer<AddDeviceBloc, AddDeviceState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.play_arrow),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Device Name"),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintColor: Colors.blueGrey,
                    fillColor: Colors.white,
                    hintText: "e.g., PlayStation 1",
                    onChanged: (value) {
                      context
                          .read<AddDeviceBloc>()
                          .add(DeviceNameChanged(value));
                      print(value);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("Notes (Optional)"),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: notesController,
                    hintText: "e.g., Near window, controller issue",
                    maxLines: 3,
                    fillColor: Colors.white,
                    onChanged: (value) {
                      context.read<AddDeviceBloc>().add(NotesChanged(value));
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Add any additional information about this device",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PlaystationSelector(
                      initialValue: selectedType,
                      onChanged: (val) {
                        context
                            .read<AddDeviceBloc>()
                            .add(DeviceTypeChanged(val));
                        print("$val i am in screen 82 add device");
                      }),
                  const SizedBox(height: 20),
                  const Text("Hourly Rate (USD)"),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: rateController,
                    hintColor: Colors.blueGrey,
                    fillColor: Colors.white,
                    hintText: "\$ 3.00",
                    onChanged: (value) {
                      context.read<AddDeviceBloc>().add(RateChanged(value));
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomGestureDetectorButton(
                    label: "Add Device",
                    onTap: () async {
                      final bloc = context.read<AddDeviceBloc>();
                      bloc.add(SubmitDevice());

                      // استنى شوي لضمان التخزين
                      await Future.delayed(const Duration(milliseconds: 300));

                      final id = await DeviceIdStorageService.getNextId();
                      final device = DeviceModel(
                        id: id.toString(),
                        name: bloc.state.name.trim(),
                        notes: bloc.state.notes.trim(),
                        type: bloc.state.type,
                        rate: bloc.state.rate.trim(),
                        sessions: [],
                      );

                      print("added $device");
                      GoRouter.of(context)
                          .pop(device); // ✅ ترجع الجهاز للـ HomeScreen
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomGestureDetectorButton(
                    label: "Cancel",
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    onTap: () => GoRouter.of(context).pop(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info, color: Colors.black45),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Quick Tip",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Use clear names like \"PS1\", \"PS2\" etc. to easily identify devices.\nYou can always edit these details later.",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
