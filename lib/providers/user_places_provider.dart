import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saved_places/models/place_model.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String name) {
    final newPlace = PlaceModel(name: name);
    state = [newPlace, ...state];
  }
}

final userPlacesNotifier = StateNotifierProvider<UserPlacesNotifier,List<PlaceModel>>(
  (ref) => UserPlacesNotifier(),
);
