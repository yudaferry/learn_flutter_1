import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_1/meals_app/providers/meals_provider.dart';
import 'package:test_1/meals_app/screen/filters.dart';

class FilterProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterProviderNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProviderNotifier, Map<Filter, bool>>(
        (ref) => FilterProviderNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilter = ref.watch(filterProvider);

  return meals.where((meal) {
    if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
