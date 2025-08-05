import 'home_section.dart';

abstract class HomeDecorator implements HomeSection {
  final HomeSection home;
  HomeDecorator(this.home);
}
