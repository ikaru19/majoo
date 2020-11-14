
class Person {

	int id;
	int isFav;
  String name;
  String height;
  String mass;
  String hair_color;
  String skin_color;
  String eye_color;
  String birth_year;
  String gender;
  String homeworld;
  String created;
  String edited;
  String url;

  Person();

	Person.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
	  isFav = map["isFav"],
		name = map["name"],
		height = map["height"],
		mass = map["mass"],
		hair_color = map["hair_color"],
		skin_color = map["skin_color"],
		eye_color = map["eye_color"],
		birth_year = map["birth_year"],
		gender = map["gender"],
		homeworld = map["homeworld"],
		created = map["created"],
		edited = map["edited"],
		url = map["url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['isFav'] = isFav;
		data['name'] = name;
		data['height'] = height;
		data['mass'] = mass;
		data['hair_color'] = hair_color;
		data['skin_color'] = skin_color;
		data['eye_color'] = eye_color;
		data['birth_year'] = birth_year;
		data['gender'] = gender;
		data['homeworld'] = homeworld;
		data['created'] = created;
		data['edited'] = edited;
		data['url'] = url;
		return data;
	}

	setID(int id){
		this.id = id;
	}

	setFav(int fav){
		this.isFav = fav;
	}
}
