import 'package:fitlover_mvps/domain/workout.dart';

abstract class DatabaseRepository {
  void addWorkout ( Workout workout);// Methode Zum Hinzufügen eines Workouts in die datenbank
  
  List<Workout> getWorkoutList(); // Methode zum Aufrufen der Liste Von Workouts 
  void deletWorkout (Workout workout); // Methode Zum Löschen eines Workouts 

}






/*Wann benutzt man void und wann einen Datentyp?
:weißes_häkchen: void → Wenn die Funktion nichts zurückgibt, sondern nur etwas ausführt, z. B. eine Aktion wie Drucken oder Setzen eines Werts.
:weißes_häkchen: Datentyp (z. B. int, String, bool, List<T>) → Wenn die Funktion einen Wert zurückgibt, den du weiterverwenden willst.*/