enum UserRole { technician, supervisor, salesperson, corporate }

UserRole parseRole(String value) {
  return UserRole.values.firstWhere(
    (e) => e.name == value,
    orElse: () => UserRole.technician,
  );
}
