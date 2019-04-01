// text adventure hooray

int chapter;

String[] descriptions = {
  "There once was an ugly barnacle", 
  "The barnacle sees friends from afar, what do you do?", 
  "NO! THIS IS PATRICK", 
  "Squidward does not want to talk to you", 
  "The ugly barnacle was so ugly he died. The End."
};

String[][] options = {
  {"follow the barnacle's journey"}, 
  {"talk to spongebob", "talk to squidward"}, 
  {"go back"}, 
  {"keep going"}, 
  {"go home"}
};

int[][] optionTargets = {
  {1}, 
  {2, 3}, 
  {1}, 
  {4}, 
  {0}
};

Scene[] scenes = new Scene[descriptions.length];

void setup() {
  size(600, 600);
  for (int i = 0; i < scenes.length; i++) {
    scenes[i] = new Scene(descriptions[i], options[i], optionTargets[i]);
  }
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(descriptions[chapter], 40, 40, 450, 300);
  textSize(24);
  int i = 0;
  for (String option : scenes[chapter].options) {
    text(i + 1, 30, 450 + i * 50);
    text(option, 70, 450 + i * 50);
    i++;
  }
}

void keyPressed() {

  for (int i = 0; i < optionTargets[chapter].length; i++) {
    if (keyCode - 49 == i) {
      chapter = optionTargets[chapter][i];
    }
  }
}

class Scene {
  String displayText;
  String[] options;
  int[] optionTargets;
  
  Scene(String txt, String[] opt, int[] targets) {
    displayText = txt;
    options = opt;
    optionTargets = targets;
  }
}
