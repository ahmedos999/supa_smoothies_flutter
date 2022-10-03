import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supasmoothies/models/smoothie_model.dart';

class Services {
  final URL = 'https://qzyacvbpgodrnskpeeqb.supabase.co';
  final API_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF6eWFjdmJwZ29kcm5za3BlZXFiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjQyNjgzMzcsImV4cCI6MTk3OTg0NDMzN30.6ePLuE2s2RfJ_ensLW0e6YAVEzuJRD-adOnd8n7CD2A';
// read data from the database and return it as list of modeled Dart object after maping it to dart object
  Future<List<Smoothie>> readData() async {
    final supabase = SupabaseClient(URL, API_KEY);
    final selectResponse = await supabase.from('smoothies').select().execute();

    if (selectResponse.error != null) {
      throw Exception(selectResponse.error!.message);
    }
    List<Smoothie> mymap = (selectResponse.data as List<dynamic>)
        .map((e) => Smoothie.fromMap(e))
        .toList();
    print(mymap.length);
    return mymap;
  }

  Future createdData(title, method, rating) async {
    Smoothie smoothie = Smoothie(title: title, method: method, rating: rating);

    PostgrestResponse<dynamic> res = await Supabase.instance.client
        .from('smoothies')
        // here 👇 you need to make smoothie.toMap() because we need to make Todo model to map --> eg  Todo(title: 'This is first todo') -> {'title': 'This is first todo'}
        .insert(smoothie.toMap())
        .execute();

    if (res.error != null) {
      print(res.error);
    }
  }
}
