//required:
//class based approach
//global state 
//move values to external data

//open
//make a child button class
//have the button states represented more visually

color button2BG = color(255, 200, 230);
String button2Text = "button 2 pressed!";

color bgColor = color(230);
int buttonSize = 125;
String textToShow = "";

Table table;

Button1 button1 = new Button1(180, 200, color(230, 255, 200), "button 1 pressed!");
Button2 button2 = new Button2(420, 200, color(255, 200, 230), "button 2 pressed!");

void setup() {
  size(600, 600);
  table = new Table();
  table.addColumn("Button1 clicks");
  table.addColumn("Button2 clicks");

  TableRow newRow = table.addRow();
  newRow.setInt("Button1 clicks", table.getRowCount() - 1);
  newRow.setInt("Button2 clicks", table.getRowCount() - 1);
  saveTable(table, "data/new.csv");
}


void draw() {
  background(bgColor);
  button1.display();
  button2.display();
}
