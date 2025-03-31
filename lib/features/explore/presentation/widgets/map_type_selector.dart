import 'package:flutter/material.dart';

class MapTypeSelector extends StatefulWidget {
  final Function(String) onMapTypeSelected;
  final String selectedMapUrl; 

  const MapTypeSelector({
    Key? key,
    required this.onMapTypeSelected,
    required this.selectedMapUrl,
  }) : super(key: key);

  @override
  _MapTypeSelectorState createState() => _MapTypeSelectorState();
}

class _MapTypeSelectorState extends State<MapTypeSelector> {
  late String _currentSelectedMapUrl;

  @override
  void initState() {
    super.initState();
    _currentSelectedMapUrl = widget.selectedMapUrl;
  }

  void _selectMapType(String mapUrl) {
    setState(() {
      _currentSelectedMapUrl = mapUrl;
    });
    widget.onMapTypeSelected(mapUrl);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMapTypeOption(
            context: context,
            icon: Icons.map,
            label: "Street",
            color: Colors.blue,
            mapUrl:
                'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}.png?key=MHrVVdsKyXBzKmc1z9Oo',
          ),
          _buildMapTypeOption(
            context: context,
            icon: Icons.satellite,
            label: "Satellite",
            color: Colors.green,
            mapUrl:
                'https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=MHrVVdsKyXBzKmc1z9Oo',
          ),
          _buildMapTypeOption(
            context: context,
            icon: Icons.terrain,
            label: "Landscape",
            color: Colors.brown,
            mapUrl:
                'https://api.maptiler.com/maps/topo/{z}/{x}/{y}.png?key=MHrVVdsKyXBzKmc1z9Oo',
          ),
        ],
      ),
    );
  }

  Widget _buildMapTypeOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required String mapUrl,
  }) {
    bool isSelected = _currentSelectedMapUrl == mapUrl;

    return GestureDetector(
      onTap: () => _selectMapType(mapUrl),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.transparent, 
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

