enum Environment { dev, prod }

class FlavorConfig {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.devConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static String get whereIAm => _config[_Config.flavor] as String;

  static bool get isDev => _config[_Config.flavor] == Environment.dev;

  static bool get isProduction => _config[_Config.flavor] == Environment.prod;

  static String get appUrl => _config[_Config.appUrl];
}

class _Config {
  static const flavor = 'flavor';
  static const appUrl = 'appUrl';

  static Map<String, dynamic> devConstants = {
    flavor: 'dev',
    appUrl: 'https://dev.rada360.com',
  };

  static Map<String, dynamic> prodConstants = {
    flavor: 'prod',
    appUrl: 'https://dev.rada360.com',
  };
}