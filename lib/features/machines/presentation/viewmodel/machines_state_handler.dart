class MachinesStateHandler {
  final bool isLoading;

  const MachinesStateHandler({this.isLoading = false});

  MachinesStateHandler copyWith({bool? isLoading, int? count}) {
    return MachinesStateHandler(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
