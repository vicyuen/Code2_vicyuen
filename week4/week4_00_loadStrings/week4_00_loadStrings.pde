// bryan ma for code 2 sp 19 A
String[] data;
ArrayList<Dot> dots = new ArrayList<Dot> ();

void setup() {
  data = loadStrings("dataPos.txt");
  colorMode (HSB); 
  size(600, 600);
  //split the numbers within the txt file with commas, call strings
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
  for (int i = 0; i < splitData.length; i++) {
    int size = 50; 
    PVector position = new PVector(int(splitData[i]) * 100 + size, height/2);
    dots.add(new Dot(position, float (splitDataSiz[i]), size ));
  }
}

void draw() {
  background(0);
  //noStroke();
  for (int i = 0; i < dots.size(); i++) {
    Dot localDot;
    localDot = dots.get(i);
    localDot.display();
  }
}
