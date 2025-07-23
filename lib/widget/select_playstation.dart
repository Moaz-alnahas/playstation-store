import 'package:flutter/material.dart';

class PlaystationSelector extends StatefulWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  const PlaystationSelector({
    super.key,
    this.initialValue = "ps4",
    required this.onChanged,
  });

  @override
  State<PlaystationSelector> createState() => _PlaystationSelectorState();
}

class _PlaystationSelectorState extends State<PlaystationSelector> {
  late String selectedPS;

  @override
  void initState() {
    super.initState();
    selectedPS = widget.initialValue;
  }

  void _select(String type) {
    setState(() => selectedPS = type);
    widget.onChanged(type); // ترجع القيمة للأب
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDeviceOption(
          label: "PlayStation 4",
          type: "ps4",
          isSelected: selectedPS == "ps4",
          onTap: () => _select("ps4"),
        ),
        _buildDeviceOption(
          label: "PlayStation 5",
          type: "ps5",
          isSelected: selectedPS == "ps5",
          onTap: () => _select("ps5"),
        ),
      ],
    );
  }

  Widget _buildDeviceOption({
    required String label,
    required String type,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueGrey : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey.shade300,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              Icons.play_arrow_rounded,
              color: isSelected ? Colors.white : Colors.black,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
