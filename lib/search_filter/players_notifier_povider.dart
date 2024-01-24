import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'players_notifier_povider.g.dart';




@riverpod
class PlayersNotifier extends _$PlayersNotifier {

  final List<Map<String,dynamic>> allPlayers = [
     
        {
          "name":"Shahid Afridi",
          "country":"Pakistan",
          },
        {
          "name":"Mitchel Starc",
          "country":"Australia",
          },
        {
          "name":"Virat Kohli",
          "country":"India",
          },
        {
          "name":"Joe Root",
          "country":"England",
          },
        {
          "name":"Martin Guptill",
          "country":"Newzealand",
          },
        {
          "name":"Chris Gayle",
          "country":"West Indies",
          },
      ]
  ;
    @override
    build(){
      return allPlayers;   
    }


  void filterPlayer(String byName){
    List<Map<String,dynamic>>  result = [];
    if (byName.isEmpty) {
      result = allPlayers;
    }
    else{
      result = state.where((e)=> e["name"].toString().toLowerCase().contains(byName.toLowerCase())).toList();
    }
    state = result;
  }

}