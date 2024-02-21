import 'package:countries_world_map/data/maps/countries/azerbaijan.dart';
import 'package:flutter/material.dart';

class MapState extends ChangeNotifier {
  String? _selectedAreaId; // Variable to track the selected area ID
  Map<String, Color?> _mapColors = {}; // Map to store the colors of each area
  Map<String, Color?> _originalColors =
      {}; // Map to store the original colors of each area

  Map<String, Color?> get mapColors => _mapColors;

  MapState() {
    // Initialize the map with the default colors
    _mapColors = SMapAzerbaijanColors().toMap();
    _originalColors =
        SMapAzerbaijanColors().toMap(); // Store the original colors
  }

  void updateSelectedArea(String id) {
    if (_selectedAreaId != null) {
      // Revert the color of the previously selected area
      _mapColors[_selectedAreaId!] = _originalColors[_selectedAreaId!];
    }

    // Update the color of the newly selected area to black
    _mapColors[id] = Colors.black;
    _selectedAreaId = id; // Track the newly selected area ID
    notifyListeners();
  }
}
