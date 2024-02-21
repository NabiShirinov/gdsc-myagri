class Weather {
  int? pressure, humidity;
  double? temp, wind;
  Weather({
    this.humidity,
    this.temp,
    this.wind,
    this.pressure,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      temp: json['main']['temp'],
      wind: json['wind']['speed'],
    );
  }
}
