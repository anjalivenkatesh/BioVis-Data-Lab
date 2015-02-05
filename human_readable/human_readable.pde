//For printing purposes
//It is important to note that since the assignment asks us to print the array and then the rows
//I have done exactly that
Table table;

//This is the table we will eventually convert to csv
Table tableWithColumnNames = new Table();

void setup() {
  String[] attributeNames = {
    "animal name", "hair", "feathers", "eggs", "milk", "airborne", "aquatic", "predator", "toothed", "backbone", "breathes", "venomous", "fins", "legs", "tail", "domestic", "catsize", "type"
  };

  String[] types = {
    "Nominal", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", 
    "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Boolean", "Numeric", "Boolean", "Boolean", "Boolean", "Numeric"
  };

  table = loadTable("zoo.data","csv");
  
  //Add columns to table and print the attribute names array in a comma-separated format:
  for (int i = 0; i < attributeNames.length; i++) {
    tableWithColumnNames.addColumn(attributeNames[i]);
    
    print((i > 0 ? ", " : "") + attributeNames[i]);
  }
  print("\n");

  //Here, we iterate through the rows of the table loaded from zoo.data
  //Within each row, we iterate through the attribute types array and replace 0's and 1's in the table row with False or True, if the attribute type is boolean
  //Then, when this replacement is done, we print the row in a comma-separated format  
  //Finally, we copy the row over to our table which has column names
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
    tableWithColumnNames.addRow(row);
  } //end row iterator
  
  saveTable(tableWithColumnNames, "data/new.csv");
}

