void setup() {
  JSONObject data = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&APPID=ec8bfe8523ee81fd455f2a34df0bcf17");
  JSONArray weather = data.getJSONArray("weather");
  JSONObject element = weather.getJSONObject(0);
  
  int id = element.getInt("id");
  String main = element.getString("main");
  String description = element.getString("description");
  String icon = element.getString("icon");
  
  String cityName = data.getString("name");
 
  size(600, 600);
  background(255);
  fill(0);
  textSize(20);
  text(main, 50, 150);
  text(description, 50, 200);
  text(cityName, 50, 250);
 
}

void draw() {
  
}
