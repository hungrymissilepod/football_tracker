import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {

  Future<http.Response> get(String url) async {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-Auth-Token': dotenv.env['FOOTBALL_DATA_API_TOKEN'] ?? '',
      },
    );
    return response;
  }
}

/// first get data on the most recent COMPLETED competiition via this 
    /// endpoint: /v4/competitions/PL
    /// 
    /// IF the data contains a competition with the current year it means that the competition has already ended
    /// 
    /// In this case get the next bit of data using the data of the end data of the competition
    /// 
    /// If the competition has not ended, get the next bit of data with the current data - 30 days

    /// {{url}}/v4/competitions/PL/matches?dateTo=2023-05-05&dateFrom=2023-04-05&
    /// use this endpoint to fetch data on recent matches
    /// 
    /// Parse all Match data
    /// 
    /// Iterate through all Matches and parse all homeTeams and awayTeams into Team objects
    /// 
    /// If we have already parsed a Team with the same id then we don't need to add it to the list
    /// 
    /// For each Match, check the Score object. Based on the winner property, incremement the wins for the Team
    /// 
    /// Add the the end we should be able to see which Team won the most matches
    /// 
    
    /// Now get Team data for the winning team via this endpoint:
    /// /v4/teams/{id}
    /// 
    /// Display data in UI