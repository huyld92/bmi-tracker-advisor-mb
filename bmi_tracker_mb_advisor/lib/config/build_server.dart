class BuildServer {
  static Uri buildUrl(String endpoint) {
    // const String host = "http://34.142.159.243:8080/api/";
    // const String host = "http://34.142.159.243:9090/api/";
    const String host = "https://34.142.159.243:443/api/";
    // const String host = "http://35.247.135.183:9090/api/";

    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
//
// static final String createOrderUrl =
//     "https://sb-openapi.zalopay.vn/v2/create";
}
