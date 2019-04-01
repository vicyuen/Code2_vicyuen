//state = screen
//string for each option - corresponds to a keypress

int state = 0;
String[] descriptions = {
  "You wake up in a swimming pool in a swamp.", 
  "state0",
  "state1",
  "state2",
};

String[][] options = {
  {"go to state 1", "go to state 2"}, 
  {"go to state 0"},
  {"option1", "option0"}
};

int[][] optionTargets = {
  {1,2},
  {0},
  {1,0}
};

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(descriptions[state], 40, 40, 450, 300);

  textSize(24);
  int i = 0;
  for(String option : options[state]){
    text(option, 40, 450 + i*50);
    i++;
  }
}

void keyPressed(){
  //state = (state+1) % descriptions.length;
  if(key=='1'){
    println("1 pressed");
  }
  
    if(key=='2'){
    println("2 pressed");
  }
}
