import 'package:fitlover_mvps/domain/workout.dart';

abstract class DatabaseRepository {
  Future<void> addWorkout(Workout workout); // Methode zum Hinzufügen eines Workouts asynchron
  
  Future<List<Workout>> getWorkoutList(); // Methode zum Aufrufen der Liste von Workouts asynchron
  Future<void> deletWorkout(Workout workout); // Methode zum Löschen eines Workouts asynchron
}