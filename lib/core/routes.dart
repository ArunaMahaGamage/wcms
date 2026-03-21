import 'package:wcms/views/admin/add_admin_screen.dart';

class Routes {
  static const splash = '/splash';
  static const userSelector = '/user_selector';

  // Admin
  static const signInAdmin = '/signIn_admin';
  static const dashboardAdmin = '/dashboard_admin';
  static const allComplainAdmin = '/all_complain_admin';
  static const currentSchedulesAdmin = '/current_schedules_admin';
  static const schedulesRoutesAdmin = '/schedules_routes_admin';
  static const addAdmin = '/add_admin';
  static const addDrivers = '/add_drivers';
  static const addHelpers = '/add_helpers';
  static const addVehicles = '/add_vehicles';
  static const reports = '/reports';



  // Citizen
  static const signUpCitizen = '/sign_up_citizen';
  static const signUpCitizenStatus = '/sign_up_citizen_status';
  static const signInCitizen = '/sign_in_citizen';
  static const dashboardCitizen = '/dashboard_citizen';
  static const complaintCitizen = '/complaint_citizen';
  static const complaintCitizenStatus = '/complaint_citizen_status';
  static const complaintListCitizen = '/complaint_list_citizen';
  static const requestRouteCitizen = '/request_route_citizen';
  static const requestNewBinCitizen = '/request_new_bin_citizen';
  static const recyclingTipsCitizen = '/recycling_tips_citizen';
  static const policyUpdateCitizen = '/citizen_policy_update_citizen';
  static const environmentImpactCitizen = '/environment_impact_citizen';
  static const environmentalLawCitizen = '/environmental_law_citizen';

  // Driver
  static const signInDriver = '/sign_in_driver';
  static const dashboardDriver = '/dashboard_driver';

  // Helper
  static const signInHelper = '/sign_in_helper';
  static const dashboardHelper = '/dashboard_helper';

  static const onboarding = '/onboarding';
  static const home = '/home';
}