
import 'package:app/Classes/CityDisplay.dart';



List<String> germanyKeyWords = [
  "germany","berlin","גרמניה","ברלין"
];

List<String> ParisKeyWords = [
  "paris","france","France","Paris","PARIS","FRANCE"
];


List<CityDisplay> GlobalCities = [
  
  CityDisplay( name: "Berlin", image: "assets/berlin.png",keywords: germanyKeyWords,),
  CityDisplay( name: "London", image: "assets/london.png",keywords: germanyKeyWords,),
  CityDisplay( name: "Paris", image: "assets/paris.png",keywords: ParisKeyWords,),
  CityDisplay( name: "Prague", image: "assets/prague.png",keywords: germanyKeyWords,),

];

List<CityData> GlobalCitiesData = [

  CityData("ברלין", "assets/berlin.png",germanyKeyWords),
  CityData("ברלין", "assets/berlin.png",germanyKeyWords),
  CityData("לונדון", "assets/london.png",ParisKeyWords),
  CityData("פריז", "assets/paris.png",ParisKeyWords),
  CityData("פראג", "assets/prague.png",ParisKeyWords),
  CityData("פראג", "assets/prague.png",ParisKeyWords),
  CityData("פראג", "assets/prague.png",ParisKeyWords),
  CityData("יוון", "assets/prague.png",ParisKeyWords),


];