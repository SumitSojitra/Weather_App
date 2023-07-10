class Current {
  String last_updated;
  double temp_c;
  double temp_f;
  int is_day;
  double wind_mph;
  double wind_kph;
  String wind_dir;
  int humidity;
  int cloud;

  Current({
    required this.humidity,
    required this.is_day,
    required this.last_updated,
    required this.temp_c,
    required this.temp_f,
    required this.wind_dir,
    required this.wind_kph,
    required this.wind_mph,
    required this.cloud,
  });

  factory Current.fromMap({required Map data}) {
    return Current(
      humidity: data['humidity'],
      is_day: data['is_day'],
      last_updated: data['last_updated'],
      temp_c: data['temp_c'],
      temp_f: data['temp_f'],
      wind_dir: data['wind_dir'],
      wind_kph: data['wind_kph'],
      wind_mph: data['wind_mph'],
      cloud: data['cloud'],
    );
  }
}
