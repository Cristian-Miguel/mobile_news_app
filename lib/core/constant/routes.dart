class Routes {
  //DEV,PROD,TEST
  static final String enviroment = 'DEV';

  static String get baseRoute {
    switch (enviroment) {
      case 'DEV':
        return 'http://192.168.1.11:8090/api';
      case 'PROD':
        return 'http://localhost:3000';
      case 'TEST':
        return 'http://localhost:3000';
      default:
        return 'http://localhost:3000';
    }
  }

  static String get signInRoute => '$baseRoute/auth/sign_in';
  static String get signUpRoute => '$baseRoute/auth/sign_up';
  static String get signOutRoute => '$baseRoute/auth/sign_out';
  static String get refreshTokenRoute => '$baseRoute/auth/refresh_token';
}
