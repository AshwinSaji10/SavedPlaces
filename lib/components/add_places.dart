import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saved_places/providers/user_places_provider.dart';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final _itemNameContoller = TextEditingController();

  @override
  void dispose() {
    _itemNameContoller.dispose();
    super.dispose();
  }

  void _savePlace() {
    final placeName = _itemNameContoller.text;

    if (placeName.isEmpty) {
      return;
    }

    ref.read(userPlacesNotifier.notifier).addPlace(placeName);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _itemNameContoller,
              decoration: const InputDecoration(
                label: Text("Enter the place name"),
              ),
            ),
            ElevatedButton(
              onPressed: _savePlace,
              child: const Text("Add place"),
            )
          ],
        ),
      ),
    );
  }
}
