import 'package:test/test.dart';
import 'package:mockito/mockito.dart'; // For mocking Firestore

// Import the class you want to test
import 'package:your_project_name/home_page.dart'; // Replace with the actual path

// Create a mock Firestore instance
class MockFirestore extends Mock implements FirebaseFirestore {}

void main() {
  group('HomePage', () {
    test('getDocId should populate docIDs with document IDs', () async {
      // Arrange
      final mockFirestore = MockFirestore();
      final homePage = HomePage(firestore: mockFirestore); // Pass the mock to the class
      
      // Define a fake QuerySnapshot with two documents
      final fakeQuerySnapshot = QuerySnapshot(
        // Adjust the structure based on your actual data
        docs: [
          QueryDocumentSnapshot(
            data: {'field': 'value1'},
            reference: DocumentReference(
              // Adjust the path as needed
              FirebaseFirestore.instance.doc('users/document1'),
            ),
          ),
          QueryDocumentSnapshot(
            data: {'field': 'value2'},
            reference: DocumentReference(
              FirebaseFirestore.instance.doc('users/document2'),
            ),
          ),
        ],
      );

      // Stub the Firestore collection call to return the fake QuerySnapshot
      when(mockFirestore.collection('users').get()).thenAnswer(
        (_) => Future.value(fakeQuerySnapshot),
      );

      // Act
      await homePage.getDocId();

      // Assert
      expect(homePage.docIDs, ['document1', 'document2']);
    });
  });
}
