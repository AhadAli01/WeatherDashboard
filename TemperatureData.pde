  class TemperatureData{
    
    Date date;
    float minTemp;
    float maxTemp;
    float snowFall;
    
    TemperatureData(int M, int Y, float minT, float maxT, float snow) { 
      date = new Date (M, Y); 
      minTemp = minT;
      maxTemp = maxT;
      snowFall = snow;
    }
    
  }
