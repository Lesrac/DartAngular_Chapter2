library recipe_book;

import 'package:angular/angular.dart';
import 'package:angular/application_factory_static.dart';
import 'main_static_expressions.dart' as generated_static_expressions;
import 'main_static_metadata.dart' as generated_static_metadata;
import 'main_static_injector.dart' as generated_static_injector;

/* Use the @Controller annotation to indicate that this class is an
 * Angular controller. Angular will instantiate the controller if
 * it finds an element matching its selector in the DOM.
 *
 * The selector field defines the CSS selector that will trigger the
 * controller. It can be any valid CSS selector which does not cross
 * element boundaries.
 *
 * The publishAs field specifies that the controller instance should be
 * assigned to the current scope under the name specified.
 *
 * The controller's public fields are available for data binding from the view.
 * Similarly, the controller's public methods can be invoked from the view.
 */
@Controller(
    selector: '[recipe-book]',
    publishAs: 'ctrl')
class RecipeBookController {
  Recipe selectedRecipe;
  List<Recipe> recipes;

  RecipeBookController() {
    recipes = _loadData();
  }

  void selectRecipe(Recipe recipe) {
    selectedRecipe = recipe;
  }

  List<Recipe> _loadData() {
    return [
      new Recipe('My Appetizer','Appetizers',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 1),
      new Recipe('My Salad','Salads',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 3),
      new Recipe('My Soup','Soups',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 4),
      new Recipe('My Main Dish','Main Dishes',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 2),
      new Recipe('My Side Dish','Side Dishes',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 3),
      new Recipe('My Awesome Dessert','Desserts',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 5),
      new Recipe('My So-So Dessert','Desserts',
          ["Ingredient 1", "Ingredient 2"],
          "Some Directions", 3),
    ];
  }
}

class Recipe {
  String name;
  String category;
  List<String> ingredients;
  String directions;
  int rating;

  Recipe(this.name, this.category, this.ingredients, this.directions,
      this.rating);
}

class MyAppModule extends Module {
  MyAppModule() {
    type(RecipeBookController);
  }
}

void main() {
  staticApplicationFactory(generated_static_injector.factories, generated_static_metadata.typeAnnotations, generated_static_expressions.getters, generated_static_expressions.setters, generated_static_expressions.symbols)
      .addModule(new MyAppModule())
      .run();
}
