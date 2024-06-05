import 'package:flutter/material.dart';
import 'package:saved_places/components/add_places.dart';
import 'package:saved_places/models/place_model.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({super.key, required this.places});
  final List<PlaceModel> places;

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  // final List<PlaceModel> places=places;
  // if(widget.places.isEmpty?){

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Places"),
      ),
      body: widget.places.isEmpty
          ? const Text("No places yet")
          : ListView.builder(
              itemCount: widget.places.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(widget.places[index].name),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPlaces(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
