import 'package:flutter/material.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/domain/repositories/tourism_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentSlider = 0;
  final TourismRepository tourismRepository;

  List<Event> events = [];
  List<Place> places = [];
  List<Lodging> lodging = [];

  CategoryProvider({required this.tourismRepository});

  int get currentSlider => _currentSlider;
  set currentSlider(int value) {
    _currentSlider = value;
    notifyListeners();
  } 

   Future<void> loadData() async {
    events = await tourismRepository.getEvents();
    places = await tourismRepository.getPlaces();
    lodging = await tourismRepository.getLodging();
    notifyListeners();
  }

  List<dynamic> getOnDisplayData(String category) {
    final onDisplayData = [];
    final Set<String> types = {};

    switch (category) {
      case 'Eventos':
        for (final event in events) {
          final type = event.tipo;
          
          if (!types.contains(type)){
            types.add(type);
            onDisplayData.add(event);
          }
        }
        break;
      case 'Lugares':
        for (final place in places) {
          final type = place.tipo;
          
          if (!types.contains(type)){
            types.add(type);
            onDisplayData.add(place);
          }
        }
        break;
      case 'Hospedaje':
        for (final element in lodging) {
          final type = element.tipo;
          
          if (!types.contains(type)){
            types.add(type);
            onDisplayData.add(element);
          }
        }
        break;
      default:
    }

    return onDisplayData;
  }

  List<dynamic> getItemsBySubcategory({required String category, required String subcategory}) {
    final items = [];

    switch (category) {
      case 'Eventos':
        items.addAll(events.where((element) => element.tipo == subcategory));
        break;
      case 'Lugares':
        items.addAll(places.where((element) => element.tipo == subcategory));
        break;
      case 'Hospedaje':
        items.addAll(lodging.where((element) => element.tipo == subcategory));
        break;
      default:
    }

    return items;
  }
}