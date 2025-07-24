class AppInitializerState {
  final bool isLoading;

  AppInitializerState({required this.isLoading});

  AppInitializerState copyWith({bool? isLoading}) {
    return AppInitializerState(isLoading: isLoading ?? this.isLoading);
  }

  factory AppInitializerState.initial() =>
      AppInitializerState(isLoading: false);
}