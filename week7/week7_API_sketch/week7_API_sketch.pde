float[] airQuality;
String[] location;
PVector[] position;
float[] r;
float[] a;
float max;
float min;

void setup() {
  size(800, 800);
  background(255);
  textAlign(CENTER, CENTER);
  JSONArray data = loadJSONArray("https://data.cityofnewyork.us/resource/c3uy-2p5r.json");
  airQuality = new float [96];
  location = new String[96];
  position = new PVector[96];
  r = new float[96];
  a = new float[96];

  for (int i = 0; i < 96; i++) {
    if (data.getJSONObject(i).getInt("year_description") ==2005) {
      airQuality[i] = data.getJSONObject(i).getFloat("data_valuemessage");
      location[i] = data.getJSONObject(i).getString("geo_entity_name");
    }
  }

  max = max(airQuality);
  min = min(airQuality);

  for (int i = 0; i < airQuality.length; i++) {
    r[i] = map(airQuality[i], min, max, 50, 150);
    a[i] = map(airQuality[i], min, max, 30, 200);
    position[i] = new PVector(random(r[i]/2, width-r[i]/2), random(r[i]/2, height-r[i]/2));
    fill(0, 0, 255, a[i]);
    ellipse(position[i].x, position[i].y, r[i], r[i]);
    fill(255, 0, 255);
    textSize(12);
    text(location[i], position[i].x, position[i].y);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < airQuality.length; i++) {
    r[i] = map(airQuality[i], min, max, 50, 150);
    a[i] = map(airQuality[i], min, max, 30, 200);
    fill(0, 0, 255, a[i]);
    ellipse(position[i].x, position[i].y, r[i], r[i]);
    fill(255, 0, 255);
    textSize(12);
    text(location[i], position[i].x, position[i].y);
  }

  for (int i =0; i < airQuality.length; i++) {
    if (dist(mouseX, mouseY, position[i].x, position[i].y) < r[i]/2) {
      fill(0, 255, 255, a[i]);
      ellipse(position[i].x, position[i].y, r[i]*2, r[i]*2);
      fill(255, 0, 0);
      textSize(26);
      text(location[i], position[i].x, position[i].y);
    }
  }
}
