// state = screen
// text to display for each screen   (state representation)
// options to choose for each screen (state transitions)

// string for each text
// string for each option - corresponds to a keypress

int state = 0;
JSONArray values;

color [] bgColor = {
  color(255, 81, 50), 
  color(71, 209, 100), 
  color(122, 162, 255)
};

PImage[]photo = new PImage[3];

String[] descriptions = {
  "You wake up in Code 2 class and don't know what is going on", 
  "your eyelids feel so heavy, and you fail to wake up", 
  "you feel enlightened by the answer, but still fall asleep", 
};

String[][] options = {
  {"try to wake up", "ask a question"}, 
  {"you sleep"}, 
  {"struggle to stay awake", "enjoy the sweet surrender of sleep"}
};

int[][] optionTargets = {
  {1, 2}, 
  {0}, 
  {1, 0}, 
};

void setup() {
  size(600, 600);
  photo[0]=loadImage("sleep1.jpg");
  photo[1]=loadImage("sleep2.jpg");
  photo[2]=loadImage("sleep3.png");
  
  values = new JSONArray();
  for(int i = 0; i < descriptions.length; i++){
    JSONObject scene = new JSONObject();
    
    scene.setString("descriptions", descriptions[i]);
    scene.setInt("bgColor", bgColor[i]);
    
    JSONArray arr = new JSONArray();
    for(int j = 0; j < options[i].length; j++){
      arr.append(options[i][j]);
    }
      
    scene.setJSONArray("options", arr);  

    JSONArray targetArr = new JSONArray();
    for(int j = 0; j < optionTargets[i].length; j++){
     targetArr.append(optionTargets[i][j]); 
    }
    
    scene.setJSONArray("option targets", targetArr);
    
    values.setJSONObject(i, scene);
  }
  saveJSONArray(values, "data/new.json");
}

void draw() {
  background(bgColor[state]);
  textSize(40);
  fill(255);
  text(descriptions[state], 40, 40, 450, 300);
  //for(int i=0;i<photo;i++){ 
  photo[state].resize(300, 0);
  image(photo[state], 150, 300);
  textSize(24);
}

void keyPressed() {
  //state = (state + 1) % descriptions.length;
  //if (keyCode == 49) {
  //  state = optionTargets[state][0];
  //}
  //if (keyCode == 50) {
  //  state = optionTargets[state][1];
  //}
  //if (keyCode == 51) {
  //  state = optionTargets[state][2];
  //}

  for (int i = 0; i < optionTargets[state].length; i++) {
    if (keyCode - 49 == i) {
      state = optionTargets[state][i];
    }
  }
}
