import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import '../../viewmodels/helper/feedback_provider.dart';
import '../../models/helper/helper_feedback.dart';

class HelperFeedbackScreen extends ConsumerWidget {
  const HelperFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final feedbackData = ref.watch(helperFeedbackFormProvider);
    final submissionState = ref.watch(feedbackSubmitProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardHelper))
          ),
          title: const Text("Submit Feedback")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: feedbackData['category'],
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ['General', 'Vehicle Issue', 'Route Issue', 'Equipment']
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (val) {
                  ref.read(helperFeedbackFormProvider.notifier).state = {
                    ...feedbackData,
                    'category': val,
                  };
                },
              ),
              const SizedBox(height: 20),
              const Text("Your Comment", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Describe your feedback or issue here...",
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) => feedbackData['comment'] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: submissionState.isLoading
                      ? null
                      : () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      // You would get these from your Auth Provider/Store
                      final feedback = HelperFeedback(
                        helperId: "H-1023", // Example ID
                        vehicleId: "WP-6782", // Example Vehicle
                        category: feedbackData['category'],
                        comment: feedbackData['comment'],
                      );

                      await ref.read(feedbackSubmitProvider.notifier).sendFeedback(feedback);

                      if (ref.read(feedbackSubmitProvider).hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${ref.read(feedbackSubmitProvider).error}")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Feedback sent successfully!")),
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: submissionState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Submit Feedback"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}