import 'package:http/http.dart' as http;

const api = 'https://rest.coinapi.io/v1/exchangerate/BTC?apikey=';
const apiKey = '7BE85476-D4CD-48BF-BD26-4C2B2F09D1AC';

class Network {
  Network(this.currency1, this.currency2);
  final String currency1, currency2;

  Future getData() async {
    String url = '$api$apiKey';

    var uri = Uri.parse(url);
    var response = await http.get(uri);
    //var data = jsonDecode(response);
    print(response.body);
  }
}
