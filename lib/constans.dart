
import 'package:dio/dio.dart';



DateTime datey =DateTime.now().subtract(const Duration(days:2)) ; 
String dateyes = datey.toString().substring(0,10);
DateTime dates=DateTime.now().subtract(const Duration(days: 1));
String datez = dates.toString().substring(0,10);
const api="?api_key=82a1cd52cc96e1e5d2d510dcd7e793a0d243cb1b&format=json";
String url="https://comicvine.gamespot.com/api/issues/?api_key=82a1cd52cc96e1e5d2d510dcd7e793a0d243cb1b&filter=date_added:$dateyes|$datez&format=json";

String baseUrl = url;  
final kDioOptions = BaseOptions(
  baseUrl: baseUrl,
);


