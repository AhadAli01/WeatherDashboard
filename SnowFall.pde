//draw snow
void drawSnow() {

  int counter = 0;
  float multiplier = 15;
  float ogWidth = 4;
  float lower = cp5.getController("MinYear").getValue();
  float upper = cp5.getController("MaxYear").getValue();
  strokeWeight(3);

  for (TemperatureData d : tempData) {
    stroke(255, 255, 255);
    ellipse(210 + counter, 450 - d.snowFall*multiplier, 2, 2);
    counter +=(4*(29/(upper-lower)));
  }
}

//draw snowman

void drawSnowMan() {
  
  ellipse(1600, 725, 100, 100);
  ellipse(1600, 650, 75, 75);
  ellipse(1600, 600, 50, 50);
  
  fill(0);
  ellipse(1600, 725, 10, 10);
  ellipse(1600, 690, 10, 10);
  ellipse(1600, 650, 10, 10);
  
  ellipse (1590, 595, 7, 7);
  ellipse (1610, 595, 7, 7);
  
  fill(#FF8E03);
  ellipse (1600, 610, 8, 8);
  
  
  


}
