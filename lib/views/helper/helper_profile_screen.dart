import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import '../../viewmodels/helper/helper_profile_provider.dart';

class HelperProfileScreen extends ConsumerWidget {
  const HelperProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(helperProfileProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Future.microtask(() =>
              Navigator.pushReplacementNamed(context, Routes.dashboardHelper)),
        ),
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (profile) => SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "${profile.firstName} ${profile.lastName}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Employee ID: ${profile.employeeNumber}",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Divider(),
              _buildProfileItem(Icons.badge, "NIC Number", profile.idNumber),
              _buildProfileItem(Icons.phone, "Mobile", profile.mobileNumber),
              _buildProfileItem(Icons.home, "Address", profile.address),
              _buildProfileItem(Icons.cake, "Date of Birth", profile.dateOfBirth),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Handle Logout logic
                      Navigator.pushReplacementNamed(context, Routes.signInHelper);
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
    );
  }
}