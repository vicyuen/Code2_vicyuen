// bryan ma for code 2 sp19 A

// replace the sizes integer array with csv data loaded externally.
Table table;

int[] sizes = { 300, 500, 100, 200, 400, 300, 500, 200 };

ArrayList<Vert> verts = new ArrayList<Vert>();

void setup() {
  size(800, 600);
  table = new Table();
  table.addColumn("size");

  for (int i = 0; i < sizes.length; i++) {
    TableRow newRow = table.addRow();
    newRow.setInt("size", sizes[i]);
  }

  saveTable(table, "data/data.csv");

  rectMode(CENTER);
  int rowCount = 0;
  for (TableRow row : table.rows()) {
    int size = row.getInt("size");
    int x = int(map(rowCount, 0, table.getRowCount() - 1, 100, 700));
    verts.add(new Vert(x, size));
    rowCount++;
  }

  //for (int i = 0; i < sizes.length; i++) {
  //  float x = map(i, 0, sizes.length - 1, 100, 700);
  //  float y = height/2;
  //  float w = 50;
  //  float h = sizes[i];
  //  rect(x, y, w, h);
  //}
}

void draw() {
  for (int i = 0; i < verts.size(); i++) {
    Vert myVert;
    myVert = verts.get(i);
    myVert.display();
  }
}
