import 'package:fitlover_mvps/Data/database_repository.dart';
import 'package:fitlover_mvps/domain/workout.dart';

class MockDatabaseRepository extends DatabaseRepository {
  List<Workout> workoutList = [
    Workout("Bankdrücken", "assets/Bank.jpeg",
        "Eine der besten Übungen für die Brustmuskulatur."),
    Workout("Kniebeugen", "assets/kmie.png",
        "Eine grundlegende Übung für starke Beine und den unteren Rücken."),
    Workout("Kreuzheben", "assets/Kreuz.jpeg",
        "Eine Ganzkörperübung, die besonders den unteren Rücken stärkt."),
    Workout("Schulterdrücken", "assets/Schulter.jpeg",
        "Stärkt die Schultermuskulatur und verbessert die Stabilität."),
    Workout("Bizeps Curls", "assets/Bizeps.jpeg",
        "Isolierte Übung zur Stärkung des Bizeps."),
    Workout("Trizeps Dips", "assets/dips.jpeg",
        "Hervorragende Übung zur Kräftigung des Trizeps."),
    Workout("Klimmzüge", "assets/Klimm.jpeg",
        "Eine der besten Übungen für den Rücken und die Arme."),
    Workout("Beinpresse", "assets/Bein.jpeg",
        "Kräftigt die Beine und schont den unteren Rücken."),
  ];
  @override
  void addWorkout(Workout workout) {
    workoutList.add(workout );

  }

  @override
  void deletWorkout(Workout workout) {
    workoutList.remove(workout);
  }

  @override
  List<Workout> getWorkoutList() {
    return workoutList;
  }
}