///Constants for TheCatApi
abstract class TheCatApiConsts {
  ///ApiKey used in the api requests
  static const privateKey = String.fromEnvironment('API_KEY');

  ///Api url
  static const baseUrl = 'https://api.thecatapi.com/v1/';
}
