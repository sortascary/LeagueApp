class Leaguemodel{
  int? id;
  String Image;
  String Teamname;
  String facebook;
  String website;
  String twitter;
  bool liked;

  Leaguemodel({
    this.id,
    required this.Image,
    required this.Teamname,
    required this.facebook,
    required this.website,
    required this.twitter,
    required this.liked,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Image': Image,
      'Teamame': Teamname,
      'facebook': facebook,
      'website': website,
      'twitter': twitter,
      'liked': liked ? 1 : 0,
    };
  }

  // Convert a Map object into a Task object
  factory Leaguemodel.fromMap(Map<String, dynamic> map) {
    return Leaguemodel(
      id: map['id'],
      Image: map['Image'], 
      Teamname: map['Teamname'], 
      facebook: map['facebook'], 
      website: map['website'], 
      twitter: map['twitter'],
      liked: map['liked'] == 1, 
    );
  }
}