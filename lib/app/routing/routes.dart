abstract final class Routes {
  static const appInitializer = '/';

  //---login
  static const login = "/login";

  static const forgetPasswordRelative = "forget_password";
  static const forgetPassword = "$login/$forgetPasswordRelative}";

  //---login end

  //---home
  static const home = "/home";

  static const machinesListingRelative = "machines_listing";
  static const machinesListing = "$home/$machinesListingRelative";

  static const tasksListingRelative = "tasks_listing";
  static const tasksListing = "$home/$tasksListingRelative";

  static const tasksDetailsRelative = "tasks_details";
  static const tasksDetails = "$tasksListing/$tasksDetailsRelative";

  //---home end
}
