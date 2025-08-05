enum AppClient { yellowbeard, dankoff, defaultClient }

AppClient parseClient(String value) {
  return AppClient.values.firstWhere(
    (e) => e.name == value,
    orElse: () => AppClient.defaultClient,
  );
}
