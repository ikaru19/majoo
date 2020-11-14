import 'package:majoo_test/models/Person.dart';


class PeopleResponse {

  int count;
  String next;
  Object previous;
  List<Person> results;

	PeopleResponse.fromJsonMap(Map<String, dynamic> map): 
		count = map["count"],
		next = map["next"],
		previous = map["previous"],
		results = List<Person>.from(map["results"].map((it) => Person.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = count;
		data['next'] = next;
		data['previous'] = previous;
		data['results'] = results != null ? 
			this.results.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
