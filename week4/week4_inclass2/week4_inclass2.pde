String dataPos = "0,1,2,3,4,5";
String dataSiz = "50,100,75,25,30,80";
void setup(){
  size(600,600);
  String[] splitData = dataPos.split(",");
  String[]splitDataSiz = dataSiz.split(",");
  //println(splitData);
  for (int i = 0; i < splitData.length; i++){
    ellipse(50 + int(splitData[i]) * 100, height/2, int(splitDataSiz[i], int(splitDataSiz[i]);
  }
}

void draw(){
  
}
