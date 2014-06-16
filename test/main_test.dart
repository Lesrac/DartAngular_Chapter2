library main_test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import '../web/main.dart';
import 'main_test_static_expressions.dart' as generated_static_expressions;
import 'main_test_static_metadata.dart' as generated_static_metadata;
import 'main_test_static_injector.dart' as generated_static_injector;

main() {
  setUp(setUpInjector);
  tearDown(tearDownInjector);

  group('recipe-book', () {
    setUp(module((Module m) => m.install(new MyAppModule())));

    test('should load recipes', inject((RecipeBookController recipesController) {
      expect(recipesController.recipes, isNot(isEmpty));
    }));

    test('should select recipe', inject((RecipeBookController recipesController) {
      var recipe = recipesController.recipes[0];
      recipesController.selectRecipe(recipe);
      expect(recipesController.selectedRecipe, same(recipe));
    }));
  });
}
