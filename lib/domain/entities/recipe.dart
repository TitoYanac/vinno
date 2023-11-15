import 'package:faker/faker.dart';

class Recipe {
  String _name; // El nombre de la receta.
  String _creatorName; // El nombre del creador de la receta.
  String _creatorImage; // La imagen del creador de la receta.
  String _image; // La imagen de la receta.
  double _rating; // La calificación de la receta, generalmente en una escala de 1 a 5.
  int _cookingTime; // El tiempo de cocción de la receta, en minutos.
  int _servings; // La cantidad de porciones que rinde la receta.
  List<String> _ingredients; // La lista de ingredientes necesarios para la receta.
  List<String> _steps; // Los pasos para preparar la receta.
  List<String> _categories; // Las categorías asociadas con la receta, como "Italiano", "Desayuno", etc.
  DateTime _creationDate; // La fecha en que se creó la receta.
  DateTime _lastModifiedDate; // La fecha en que se modificó por última vez la receta.
  Map<String, double> _nutritionInfo; // Información nutricional de la receta, como calorías, grasas, proteínas, etc.
  List<String> _utensils; // Los utensilios necesarios para preparar la receta.
  int _difficulty; // La dificultad de la receta, como "Fácil", "Medio", "Difícil".
  double _estimatedCost; // El costo estimado de preparar la receta.
  int _preparationTime; // El tiempo de preparación de la receta, en minutos.
  String _additionalInstructions; // Instrucciones adicionales para la receta.
  List<Comment> _comments; // Asumiendo que tienes una clase Comment definida - Comentarios dejados en la receta.
  List<String> _stepImages; // Imágenes para cada paso de la receta.
  String _videoUrl; // URL del video de la receta, si lo hay.

  // Atributos adicionales

  List<String> _tags = []; // Etiquetas asociadas con la receta, como "vegetariano", "sin gluten", etc.
  String _season = ''; // La temporada ideal para la receta, como "Verano" o "Invierno".
  String _occasion = ''; // La ocasión para la que es adecuada la receta, como "Desayuno", "Cena romántica", etc.
  List<String> _allergens = []; // Alérgenos presentes en la receta, como "nueces", "lácteos", "gluten", etc.
  List<String> _dietaryRestrictions = []; // Restricciones dietéticas que cumple la receta, como "vegano", "keto", "paleo", etc.
  String _source = ''; // La fuente original de la receta, como un libro de cocina o un sitio web.
  int _favoriteCount = 0; // Contador de cuántas veces ha sido marcada como favorita la receta.
  int _sharedCount = 0; // Contador de cuántas veces ha sido compartida la receta.
  bool _isPublished = false; // Indica si la receta está publicada o es un borrador.
  String _notes = ''; // Notas adicionales sobre la receta.


  // Constructor
  Recipe({
    required String name,
    required String creatorName,
    required String creatorImage,
    required String image,
    required double rating,
    required int cookingTime,
    required int servings,
    required List<String> ingredients,
    required List<String> steps,
    List<String>? categories,
    DateTime? creationDate,
    DateTime? lastModifiedDate,
    Map<String, double>? nutritionInfo,
    List<String>? utensils,
    int? difficulty,
    double? estimatedCost,
    int? preparationTime,
    String? additionalInstructions,
    List<Comment>? comments,
    List<String>? stepImages,
    String? videoUrl,
    // Añadir los siguientes parámetros adicionales
    List<String>? tags,
    String? season,
    String? occasion,
    List<String>? allergens,
    List<String>? dietaryRestrictions,
    String? source,
    int? favoriteCount,
    int? sharedCount,
    bool? isPublished,
    String? notes,
  })  : _name = name,
        _creatorName = creatorName,
        _creatorImage = creatorImage,
        _image = image,
        _rating = rating,
        _cookingTime = cookingTime,
        _servings = servings,
        _ingredients = ingredients,
        _steps = steps,
        _categories = categories ?? [],
        _creationDate = creationDate ?? DateTime.now(),
        _lastModifiedDate = lastModifiedDate ?? DateTime.now(),
        _nutritionInfo = nutritionInfo ?? {},
        _utensils = utensils ?? [],
        _difficulty = difficulty ?? 3,
        _estimatedCost = estimatedCost ?? 0.0,
        _preparationTime = preparationTime ?? 0,
        _additionalInstructions = additionalInstructions ?? '',
        _comments = comments ?? [],
        _stepImages = stepImages ?? [],
        _videoUrl = videoUrl ?? '',
  // ... continuar con la inicialización de otros campos
        _tags = tags ?? [],
        _season = season ?? '',
        _occasion = occasion ?? '',
        _allergens = allergens ?? [],
        _dietaryRestrictions = dietaryRestrictions ?? [],
        _source = source ?? '',
        _favoriteCount = favoriteCount ?? 0,
        _sharedCount = sharedCount ?? 0,
        _isPublished = isPublished ?? false,
        _notes = notes ?? '';

// Getters, setters y otros métodos

  // Getters
  String get name => _name;
  String get creatorName => _creatorName;
  String get creatorImage => _creatorImage;
  String get image => _image;
  double get rating => _rating;
  int get cookingTime => _cookingTime;
  int get servings => _servings;
  List<String> get ingredients => _ingredients;
  List<String> get steps => _steps;
  List<String> get categories => _categories;
  DateTime get creationDate => _creationDate;
  DateTime get lastModifiedDate => _lastModifiedDate;
  Map<String, double> get nutritionInfo => _nutritionInfo;
  List<String> get utensils => _utensils;
  int get difficulty => _difficulty;
  double get estimatedCost => _estimatedCost;
  int get preparationTime => _preparationTime;
  String get additionalInstructions => _additionalInstructions;
  List<Comment> get comments => _comments;
  List<String> get stepImages => _stepImages;
  String get videoUrl => _videoUrl;

  List<String> get tags => _tags;
  String get season => _season;
  String get occasion => _occasion;
  List<String> get allergens => _allergens;
  List<String> get dietaryRestrictions => _dietaryRestrictions;
  String get source => _source;
  int get favoriteCount => _favoriteCount;
  int get sharedCount => _sharedCount;
  bool get isPublished => _isPublished;
  String get notes => _notes;

  // Setters
  set name(String name) => _name = name;
  set creatorName(String creatorName) => _creatorName = creatorName;
  set creatorImage(String creatorImage) => _creatorImage = creatorImage;
  set image(String image) => _image = image;
  set rating(double rating) => _rating = rating;
  set cookingTime(int cookingTime) => _cookingTime = cookingTime;
  set servings(int servings) => _servings = servings;
  set ingredients(List<String> ingredients) => _ingredients = ingredients;
  set steps(List<String> steps) => _steps = steps;
  set categories(List<String> categories) => _categories = categories;
  set creationDate(DateTime creationDate) => _creationDate = creationDate;
  set lastModifiedDate(DateTime lastModifiedDate) =>
      _lastModifiedDate = lastModifiedDate;
  set nutritionInfo(Map<String, double> nutritionInfo) =>
      _nutritionInfo = nutritionInfo;
  set utensils(List<String> utensils) => _utensils = utensils;
  set difficulty(int difficulty) => _difficulty = difficulty;
  set estimatedCost(double estimatedCost) => _estimatedCost = estimatedCost;
  set preparationTime(int preparationTime) =>
      _preparationTime = preparationTime;
  set additionalInstructions(String additionalInstructions) =>
      _additionalInstructions = additionalInstructions;
  set comments(List<Comment> comments) => _comments = comments;
  set stepImages(List<String> stepImages) => _stepImages = stepImages;
  set videoUrl(String videoUrl) => _videoUrl = videoUrl;

  set tags(List<String> tags) => _tags = tags;
  set season(String season) => _season = season;
  set occasion(String occasion) => _occasion = occasion;
  set allergens(List<String> allergens) => _allergens = allergens;
  set dietaryRestrictions(List<String> dietaryRestrictions) =>
      _dietaryRestrictions = dietaryRestrictions;
  set source(String source) => _source = source;
  set favoriteCount(int favoriteCount) => _favoriteCount = favoriteCount;
  set sharedCount(int sharedCount) => _sharedCount = sharedCount;
  set isPublished(bool isPublished) => _isPublished = isPublished;
  set notes(String notes) => _notes = notes;


  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'] ?? '',
      creatorName: map['creatorName'] ?? '',
      creatorImage: map['creatorImage'] ?? '',
      image: map['image'] ?? '',
      rating: double.parse((map['rating']??0).toString()),
      cookingTime: int.parse((map['cookingTime']??0).toString()),
      servings: int.parse((map['servings']??0).toString()),
      //ingredients: List<String>.from(map['ingredients'] ?? []),
      ingredients: [],
      steps: List<String>.from(map['steps'] ?? []),
      categories: List<String>.from(map['categories'] ?? []),
      creationDate: map['creationDate'] != null ? DateTime.parse(map['creationDate'] as String) : null,
      lastModifiedDate: map['lastModifiedDate'] != null ? DateTime.parse(map['lastModifiedDate'] as String) : null,
      nutritionInfo: (map['nutritionInfo'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value is int ? value.toDouble() : value)
      ) ?? {},
      utensils: List<String>.from(map['utensils'] ?? []),
      difficulty: int.parse((map['difficulty']??0).toString()),
      estimatedCost: double.parse((map['difficulty']??0).toString()),
      preparationTime: int.parse((map['preparationTime']??0).toString()),
      additionalInstructions: map['additionalInstructions'] ?? '',
      comments: (map['comments'] as List<dynamic>?)?.map((e) => Comment.fromMap(e as Map<String, dynamic>)).toList() ?? [],
      stepImages: List<String>.from(map['stepImages'] ?? []),
      videoUrl: map['videoUrl'] ?? '',
      tags: List<String>.from(map['tags'] ?? []),
      season: map['season']?? '',
      occasion: map['occasion']?? '',
      allergens: List<String>.from(map['allergens'] ?? []),
      dietaryRestrictions: List<String>.from(map['dietaryRestrictions'] ?? []),
      source: map['source']?? '',
      favoriteCount: int.parse((map['favoriteCount']??0).toString()),
      sharedCount: int.parse((map['sharedCount']??0).toString()),
      isPublished: map['isPublished'] ?? false,
      notes: map['notes'] ?? '',
    );
  }


}

// Asumiendo que tienes una clase Comment definida
class Comment {
  final String text;
  final String author;
  final DateTime date;

  Comment({required this.text, required this.author, required this.date});

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      text: map['text'] ?? 'No text provided',
      author: map['author'] ?? 'Anonymous',
      date: map['date'] != null ? DateTime.parse(map['date'] as String) : DateTime.now(),
    );
  }
}
