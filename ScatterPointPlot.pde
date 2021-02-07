//draw scatter point
void drawScatter() {

  int counter = 0;
  float multiplier = 15;
  strokeWeight(2);
  float lower = cp5.getController("MinYear").getValue();
  float upper = cp5.getController("MaxYear").getValue();
  strokeWeight(5);
  
  if (min == false && max == false) {

    for (TemperatureData d : tempData) {
      if (d.maxTemp > 0)
      {
        stroke (255, 0, 0);
        point(210 + counter, 450 - d.maxTemp*multiplier);
        stroke (0, 0, 255);
        point(210 + counter, 450 - d.minTemp*multiplier);
        counter +=(4*(29/(upper-lower)));
      } else
      {
        stroke (0, 0, 255);
        point(210 + counter, 450 - d.minTemp*multiplier);
        stroke (255, 0, 0);
        point(210 + counter, 450 - d.maxTemp*multiplier);
        counter +=(4*(29/(upper-lower)));
      }
    }
  } else if (min == true && max == false) {
    for (TemperatureData d : tempData) {
      stroke (0, 0, 255);
      point(210 + counter, 450 - d.minTemp*multiplier);
      counter +=(4*(29/(upper-lower)));
    }
  } else if (min == false && max == true) {
    for (TemperatureData d : tempData) {
      stroke (255, 0, 0);
      point(210 + counter, 450 - d.maxTemp*multiplier);
      counter +=(4*(29/(upper-lower)));
    }
  }

  for (Button b : buttons) {

    if (b.isOn()) {
      drawPlotMonth();
    }
  }
}


void drawPlotMonth() {

  background(200, 200, 200);
  strokeWeight(5);


  int count = 1;
  int counter = 0;
  float multiplier = 15;
  float lower = cp5.getController("MinYear").getValue();
  float upper = cp5.getController("MaxYear").getValue();


  for (Button a : buttons) { //check each individual button to see which one is on
    if (a.isOn() && max == false && min == false) { // when max and min are unselected

      stroke(255, 0, 0);
      counter=0;
      for (int x = 0; x < tempData.length; x++) {
        if (tempData[x].date.Month == count) {
          point(210 + counter, 450 - tempData[x].maxTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }


      //min temp
      counter = 0;
      stroke(0, 0, 255);
      for (int x = 0; x < tempData.length; x++) {
        if (tempData[x].date.Month == count) {
          point(210 + counter, 450 - tempData[x].minTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }
    } else if (a.isOn() && max == true) {

      stroke(255, 0, 0);
      counter=0;
      for (int x = 0; x < tempData.length; x++) {
        if (tempData[x].date.Month == count) {
          point(210 + counter, 450 - tempData[x].maxTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }
    } else if (a.isOn() && min == true) {

      counter = 0;
      stroke(0, 0, 255);
      for (int x = 0; x < tempData.length; x++) {
        if (tempData[x].date.Month == count) {
          point(210 + counter, 450 - tempData[x].minTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }
    }


    count++;
  }
}
