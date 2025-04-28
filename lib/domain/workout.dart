class Workout {
  final String id;
  final String title;
  final String description;
  final String name;
  final String image; // Added the 'image' parameter

  Workout(
    this.id, {
    required this.title,
    required this.description,
    required this.name,
    required this.image, // Added the 'image' parameter
  });
}