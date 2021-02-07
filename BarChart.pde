//draw chart
void chartAxis() {
  strokeWeight (1.5);
  stroke (19, 48, 18);
  line(200, 0, 200, 800);
  line(200, 450, 1750, 450);

  //Get value from slider
  float lower = cp5.getController("MinYear").getValue();
  float upper = cp5.getController("MaxYear").getValue();

  fill (255);
  float incrementor = 0;
  for (float a = lower; a <= upper; a++, incrementor +=(48*(29/(upper-lower)))) {
    
    text(nf(a, 0, 0), 210 + incrementor, 500);
  }

  for (int a = 25; a >= -15; a-=5) {
    text(a, 170, 450-a*15);
  }
}

//draw bar graph
void drawBar() {

  int counter = 0;
  float multiplier = 15;
  float ogWidth = 4;
  float lower = cp5.getController("MinYear").getValue();
  float upper = cp5.getController("MaxYear").getValue();
  if (min == false && max == false) {

    for (TemperatureData d : tempData) {
      //scale
      ogWidth = 4*(29/(upper-lower));

      if (d.maxTemp > 0)
      {
        fill (255, 0, 0);
        rect (210 + counter, 450 - d.maxTemp*multiplier, ogWidth, d.maxTemp*multiplier);
        fill (0, 0, 255);
        rect (210 + counter, 450 - d.minTemp*multiplier, ogWidth, d.minTemp*multiplier);
        counter +=(4*(29/(upper-lower)));
      } else
      {
        fill (0, 0, 255);
        rect (210 + counter, 450 - d.minTemp*multiplier, ogWidth, d.minTemp*multiplier);
        fill (255, 0, 0);
        rect (210 + counter, 450 - d.maxTemp*multiplier, ogWidth, d.maxTemp*multiplier);
        counter +=(4*(29/(upper-lower)));
      }
    }
  } else if (min == true && max == false) {

    for (TemperatureData d : tempData) {
      fill (0, 0, 255);
      rect (210 + counter, 450 - d.minTemp*multiplier, ogWidth, d.minTemp*multiplier);
      counter +=(4*(29/(upper-lower)));
    }
  } else if (min == false && max == true) {
    for (TemperatureData d : tempData) {
      fill (255, 0, 0);
      rect (210 + counter, 450 - d.maxTemp*multiplier, ogWidth, d.maxTemp*multiplier);
      counter +=(4*(29/(upper-lower)));
    }
  }

  for (Button b : buttons) {
  
    if (b.isOn()) {
      drawBarMonth();
    }
  }
}

void drawBarMonth() {
  background(200, 200, 200);

  int count = 1; // eventually count will exceed the number of months
  int counter = 0; // spacing between each bars
  float multiplier = 15;
  float ogWidth = 4;
  

  for (Button a : buttons) { //check each individual button to see which one is on
    
    float lower = cp5.getController("MinYear").getValue();
    float upper = cp5.getController("MaxYear").getValue();
    
    if (a.isOn() && min == false && max == false) { 
      fill(255, 0, 0);
      counter=0; 
      for (int x = 0; x < tempData.length; x++) {
        ogWidth = 4*(29/(upper-lower));
        if (tempData[x].date.Month == count) {
          rect(210 + counter, 450 - tempData[x].maxTemp*multiplier, ogWidth, tempData[x].maxTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }


      //min temp
      counter = 0;
      fill(0, 0, 255);
      for (int x = 0; x < tempData.length; x++) {
        ogWidth = 4*(29/(upper-lower));
        if (tempData[x].date.Month == count) {
          rect(210 + counter, 450 - tempData[x].minTemp*multiplier, ogWidth, tempData[x].minTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }


      //temporary solution to maxTemp graphs under 0 not showing: just redraw
      counter = 0;
      fill(255, 0, 0);
      for (int x = 0; x < tempData.length; x++) {
        ogWidth = 4*(29/(upper-lower));
        if (tempData[x].maxTemp < 0) {
          if (tempData[x].date.Month == count) {
            rect(210 + counter, 450 - tempData[x].maxTemp*multiplier, ogWidth, tempData[x].maxTemp*multiplier);
          }
        }
        counter +=(4*(29/(upper-lower)));
      }
    } else if (a.isOn() && max == true) {
      fill(255, 0, 0);
      counter=0;
      for (int x = 0; x < tempData.length; x++) {
        ogWidth = 4*(29/(upper-lower));
        if (tempData[x].date.Month == count) {
          rect(210 + counter, 450 - tempData[x].maxTemp*multiplier, ogWidth, tempData[x].maxTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }
    } else if (a.isOn() && min == true) {
      counter = 0;
      fill(0, 0, 255);
      for (int x = 0; x < tempData.length; x++) {
        ogWidth = 4*(29/(upper-lower));
        if (tempData[x].date.Month == count) {
          rect(210 + counter, 450 - tempData[x].minTemp*multiplier, ogWidth, tempData[x].minTemp*multiplier);
        }
        counter +=(4*(29/(upper-lower)));
      }
    }
    count++;
  }
}
