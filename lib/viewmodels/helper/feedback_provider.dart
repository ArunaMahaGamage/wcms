import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/helper/helper_feedback_api_service.dart';
import '../../models/helper/helper_feedback.dart';

// To manage the submission status
class FeedbackSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  FeedbackSubmitNotifier() : super(const AsyncValue.data(null));

  Future<void> sendFeedback(HelperFeedback feedback) async {
    state = const AsyncValue.loading();
    try {
      await HelperFeedbackApiService().submitFeedback(feedback);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final feedbackSubmitProvider = StateNotifierProvider<FeedbackSubmitNotifier, AsyncValue<void>>((ref) {
  return FeedbackSubmitNotifier();
});

// To manage local form data
final helperFeedbackFormProvider = StateProvider<Map<String, dynamic>>((ref) => {
  'category': 'General',
  'comment': '',
});