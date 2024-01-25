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
  List<dynamic> onDisplayData = [];
  List<dynamic> itemsSubcategory = [];

  dynamic _currentObject;

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

  void getOnDisplayData(String category) {
    onDisplayData.clear();
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
  }

  void getItemsBySubcategory({required String category, required String subcategory}) {
    itemsSubcategory.clear();

    switch (category) {
      case 'Eventos':
        itemsSubcategory.addAll(events.where((element) => element.tipo == subcategory));
        break;
      case 'Lugares':
        itemsSubcategory.addAll(places.where((element) => element.tipo == subcategory));
        break;
      case 'Hospedaje':
        itemsSubcategory.addAll(lodging.where((element) => element.tipo == subcategory));
        break;
      default:
    }
  }

  void updateItemByCategory(int list, dynamic object){
    switch (list) {
      case 1:
        final index = onDisplayData.indexWhere((element) => element.id == object.id);
        onDisplayData[index] = object;
        break;
      case 2:
        final index = itemsSubcategory.indexWhere((element) => element.id == object.id);
        itemsSubcategory[index] = object;
        break;
      default:
    }
    notifyListeners();
  }

  dynamic get currentObject => _currentObject;
  set currentObject(dynamic value) {
    _currentObject = value;
    notifyListeners();
  }
}