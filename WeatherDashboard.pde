//Import Library
import controlP5.*;

//Declaring Objects
ControlP5 cp5;
Table table;
TemperatureData[] tempData;
Button jan, feb, mar, apr, may, jun, jul ,aug ,sep , oct, nov, dec;
Button[] buttons= {jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec}; 
String months[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};


boolean bar = false;
boolean scatter= false;
boolean snow=false;
boolean min = false;
boolean max = false;
int mini=1990;
int maxi=2019;


// Here we are cleaning up the setup function by creating functions for loading the table and drawing the graph
// and simply calling them instead
void setup () {
  size(1700, 800);
  background (200, 200, 200);
  textSize(10);
  fill(255);
  cp5 = new ControlP5(this); // creating new ControlP5 object
  cp5.addButton("BarChart").setValue(0).setPosition(250, 8).setSize(60, 45);
  cp5.addButton("ScatterPlot").setValue(0).setPosition(325, 8).setSize(60, 45);
  cp5.addButton("SnowFall").setValue(0).setPosition(400, 8).setSize(60, 45);
  cp5.addButton("MinTemp").setValue(0).setPosition(475, 8).setSize(40, 20);
  cp5.addButton("MaxTemp").setValue(0).setPosition(550, 8).setSize(40, 20);
  cp5.addSlider("MinYear").setPosition(700, 8).setRange(mini, maxi).setNumberOfTickMarks(30);//.setColorBackground(#6E6AFF).setColorForeground(#0C0898);
  cp5.addSlider("MaxYear").setPosition(700, 40).setValue(0).setRange(mini, maxi).setValue(2019).setNumberOfTickMarks(30);//.setColorBackground(#0C0898).setColorForeground(#6E6AFF);
  
  snow = false;
  min = false;
  max = false;

  
  for(int a = 0, b = 40, c = 20; a < months.length-1; a++, b+=30){
  String name = months[a];
  String name2 = months[a+1];
  
  if(a%2 == 0){ //retrieve from index 0,2,4,6..

      buttons[a] = cp5.addButton(name)
      .setValue(0)
      .setPosition(c, b)
      .setSize(30,30)
      .setSwitch(true);
  }
  
  if((a+1)%2 != 0 ){ //retrieve from index 1,3,5,7...
      buttons[a+1] = cp5.addButton(name2)
      .setValue(0)
      .setPosition(c*4, b)
      .setSize(30,30)
      .setSwitch(true);

    
  }
}

  loadTable();
}

//draw
void draw () {
  background(200);
  
  if (bar) 
    drawBar();
  
  if (scatter) 
    drawScatter();
    
  if (snow){    
    drawSnow();
    drawSnowMan();
    fill(255);
    rect(200, 750, 1500, 50);
  }
  
  if(max && (scatter || bar)){
    noStroke();
    fill(#FAB70D);
    ellipse(1700,0,225,225);
    fill(#FFF300);
    ellipse(1700,0,200,200);
    
  }
  
  if(min && (scatter || bar)){
    noStroke();
    fill(225);
    ellipse(1700,0,200,200);

  }

    
  
  chartAxis();
}

//Function used to read data from csv file
void loadTable () {    

  table = loadTable("CalgaryWeather.csv", "header"); // Here we put "header" in order to ingore the header of the table as "row zero"
  // and instead look at the row below as "row zero"
  tempData = new TemperatureData[table.getRowCount()]; // creating new TempData array object where we get the table row count as the index

  int counter =  0;
  //for each row in table.rows, iterates through entire array
  for (TableRow row : table.rows()) {

    // As counter increases, we get the next row of data
    // from the table specific to each column (such as Month and Year)
    // or Min and Max Temp
    tempData[counter] = new TemperatureData(row.getInt("Month"), row.getInt("Year"), row.getFloat("Min Temperature"), row.getFloat("Max Temperature"), row.getFloat("Snow Fall"));

    counter++;
  }
}

public void MinTemp() {
    if (!min) {
      min = true;
      max = false;
    } else {
        min = false;
    }
}

public void MaxTemp() {
    if (!max) {
      max = true;
      min = false;
    } else {
        max = false;
    }
}
public void BarChart() {

  if (!bar) {
    bar = true;
    scatter=false;
    snow=false;
    min = false;
    max = false;
  } else {
    bar = false;
    
  }
}

public void ScatterPlot() {

  if (!scatter) {
    scatter = true;
    bar=false;
    snow = false;
    min = false;
    max = false;
  } else {
    scatter = false;
  }
}

public void SnowFall() {

  if (!snow) {
    snow = true;
    scatter = false;
    bar=false;
    min = false;
    max = false;
  } else {
    snow = false;
  }
}
