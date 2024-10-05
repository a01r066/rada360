import 'package:rada360/config/flavor_config.dart';
import 'package:rada360/main/main.dart';

void main() async {
  FlavorConfig.setEnvironment(Environment.prod);
  await initializeApp();
}