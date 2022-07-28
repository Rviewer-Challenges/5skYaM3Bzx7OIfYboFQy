import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

Future<String> bonappetitRecipeFetch(String url) async {
  var response = await http.get(
    Uri.parse("https://corsproxy.io/?$url"),
  );
  var document = parse(response.body);
  var priceElement = document.getElementsByClassName("recipe__main-content");
  if (priceElement.isEmpty) {
    priceElement = document.getElementsByClassName("body__inner-container");
  }

  return priceElement[0].outerHtml;
}
