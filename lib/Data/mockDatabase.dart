import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlover_mvps/Data/database_repository.dart';
import 'package:fitlover_mvps/domain/workout.dart';

class FirestoreDatabaseRepository extends DatabaseRepository {
  final CollectionReference _workoutsCollection =
      FirebaseFirestore.instance.collection('workouts');

  @override
  Future<void> addWorkout(Workout workout) async {
    try {
      await _workoutsCollection.add({
        'title': workout.title,
        'image': workout.image,
        'description': workout.description,
      });
    } catch (e) {
      throw Exception("Error adding workout: $e");
    }
  }

  @override
  Future<void> deletWorkout(Workout workout) async {
    try {
      final snapshot = await _workoutsCollection
          .where('title', isEqualTo: workout.title)
          .get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw Exception("Error deleting workout: $e");
    }
  }

  @override
  Future<List<Workout>> getWorkoutList() async {
    try {
      final snapshot = await _workoutsCollection.get();
      return snapshot.docs.map((doc) {
        return Workout(
          '',
          title: doc['title'],
          image: doc['image'],
          description: doc['description'],
          name: '', 
        );
      }).toList();
    } catch (e) {
      throw Exception("Error fetching workouts: $e");
    }
  }
}
