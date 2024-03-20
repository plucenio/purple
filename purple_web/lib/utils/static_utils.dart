// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import '../lib.dart';

const String APP_NAME = 'Purple';

///
/// Provides a static access to a singleton that implements [Navigation]
///
final INavigation Nav = ModularNavigation.i();

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final IDependencyManager DM = ModularDependencyManager.i();

///
/// `BASE_URL` is the base URL for the Back4APP Parse API.
///
const String BASE_URL = 'https://parseapi.back4app.com/functions';

///
/// `APP_ID` is the unique Application ID for the Back4APP Parse API.
///
const String APP_ID = '6CG5d345xurtrv4RuCflZTXgLCmA03p95ARYKdGt';

///
/// `API_KEY` is the unique API key for accessing the Parse API.
/// It is used to authenticate requests to the API.
///
const String API_KEY = '9Ai5yTF23pKwmBmQO8DQrGQh2RDaKMhITIhOcszh';

String sessionToken = '';
