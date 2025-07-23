import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playstation_store/core/model/device_model.dart';
import 'package:playstation_store/router/app_router.dart';
import 'package:playstation_store/widget/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DeviceModel> devices = [];

  Future<void> _addDevice() async {
    final newDevice = await context.push<DeviceModel>(AppRoutes.addDevice);
    if (newDevice != null) {
      setState(() {
        devices.add(newDevice);
        print("$devices i am in home screen");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addDevice,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const Divider(height: 30, color: Colors.blueGrey),
            const SizedBox(height: 20),
            _buildStats(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Devices",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${devices.length} total",
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...devices.map(_buildDeviceItem).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "playstation".tr(),
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Row(
          children: const [
            Icon(Icons.analytics, color: Colors.blueGrey, size: 20),
            SizedBox(width: 15),
            Icon(Icons.price_change_outlined, color: Colors.blueGrey, size: 20),
            SizedBox(width: 15),
            Icon(Icons.settings, color: Colors.blueGrey, size: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard("Today Earnings", "\$45.50", "409,500 SYP"),
        _buildStatCard("Active Sessions", "3", "of ${devices.length} devices"),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w500)),
          Text(value,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text(subtitle,
              style: const TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(DeviceModel device) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.play_arrow),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.name,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Idle",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.list, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Rate:",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                  Text(
                    "\$${device.rate}/h",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Type:",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                  Text(
                    device.type.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomGestureDetectorButton(
                    iconWidget: const Icon(Icons.play_arrow_rounded,
                        color: Colors.white),
                    label: "Start Session"),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: CustomGestureDetectorButton(
                  label: "",
                  backgroundColor: Colors.black12,
                  iconWidget:
                      const Icon(Icons.shopping_cart, color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
