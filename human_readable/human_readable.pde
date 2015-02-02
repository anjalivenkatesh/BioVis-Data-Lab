
Table table;

void setup() {
  String[] attributeNames = {
    "animal name", "hair", "feathers", "eggs", "milk", "airborne", "aquatic", "predator", "toothed", "backbone", "breathes", "venomous", "fins", "legs", "tail", "domestic", "catsize", "type"
  };

  String[] types = {
    "Nominal", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", 
    "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Numeric", "Boolean", "Boolean", "Boolean", "Numeric"
  };

  table = loadTable("zoo.data", "csv");
  
  //Print the attribute names array in a comma-separated format:
  for (int i = 0; i < attributeNames.length; i++) {
    print((i > 0 ? ", " : "") + attributeNames[i]);
  }
  print("\n");

  //Here, we iterate through the rows of the table loaded from zoo.data
  //Within each row, we iterate through the attribute types array and replace 0's and 1's in the table row with False or True, if the attribute type is boolean
  //Then, when this replacement is done, we print the row in a comma-separated format  
  for (TableRow row : table.rows ()) {
    for (int i = 0; i < types.length; i++) {
      if (types[i].equals("Boolean")) {
        if (row.getInt(i)==0) {
          row.setString(i, "False");
        } else {
          row.setString(i, "True");
        }
      }
      
      print((i > 0 ? ", " : "") + row.getString(i));
    } //end types array iterator   
    
    print("\n"); //newline after printing each row
  } //end row iterator
  
  saveTable(table, "data/new.csv");
}

