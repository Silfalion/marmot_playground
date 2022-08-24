import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'ENDPOINT')
  static const endpoint = _Env.endpoint;
  @EnviedField(varName: 'PROJECTID')
  static const projectId = _Env.projectId;

}
