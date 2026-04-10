import 'package:chat_app/features/home/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesService {
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  Future<void> addMessage({
    required String email,
    required String message,
  }) async {
    await messages.add({
      'email': email,
      'message': message,
      'date': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<MessageModel>> getMessagesStream() {
    return messages.orderBy('date', descending: true).snapshots().map((
      snapshot,
    ) {
      return snapshot.docs
          .where((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return data['date'] != null;
          })
          .map((doc) => MessageModel.fromJson(doc.data()))
          .toList();
    });
  }
}
