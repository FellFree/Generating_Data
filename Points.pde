import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

class Points {

  private Point[] points;
  private float currentNoiseTemperature;
  private float currentNoiseHumidity;
  private Float noiseTemp, noiseStepTemp;
  private Float noiseHum, noiseStepHym;

  Points() {

    this.noiseTemp = random(100);
    this.noiseHum = random(100);
    this.noiseStepTemp = random(3);
    this.noiseStepHym  = random(0.3);

    print("noiseStepTemp: " + noiseStepTemp + "\n" + "noiseStepHym: " + noiseStepHym + "\n");
  }

  private void generatePoints(String[] names, int middleTemperature, int middleHumidity, Calendar readDate) {

    this.points = new Point[names.length];

    for (int i = 0; i < names.length; i++) {
      this.currentNoiseTemperature = nextNoise(middleTemperature, 'T');
      this.currentNoiseHumidity = nextNoise(middleHumidity, 'H');
      this.points[i] = new Point(i, names[i], this.currentNoiseTemperature, this.currentNoiseHumidity, readDate);

      print(points[i].toString() + "\n");
    }
  }

  private float nextNoise(float middleValue, char sign) {

    switch(sign) {
    case 'T':
      this.noiseTemp += this.noiseStepTemp;
      return noise(this.noiseTemp) * middleValue;
    case 'H':
      this.noiseHum += this.noiseStepHym;
      return noise(this.noiseHum) * middleValue;
    default:
      return -1;
    }
  }

  public Point[] getPoints() {
    return this.points;
  }

  public JSONArray getJSONPoints() {
    JSONArray JSONPoints = new JSONArray();

    for (int i = 0; i < this.points.length; i++) {
      JSONObject point = new JSONObject();
      point.setInt("id", i);
      point.setString("name", points[i].name);
      point.setFloat("temperature", points[i].temperature);
      point.setFloat("humidity", points[i].humidity);
      point.setString("readDate", points[i].readDateString);

      JSONPoints.setJSONObject(i, point);
    }
    return JSONPoints;
  }
  
  public Point[] loadJSONPoints(String path) {
    
    JSONArray JSONPoints = loadJSONArray(path);

    Point[] loadPoints = new Point[JSONPoints.size()];
    
    for(int i = 0; i < JSONPoints.size(); i++) {
      JSONObject point = JSONPoints.getJSONObject(i);
      
      int id = point.getInt("id");
      String name = point.getString("name");
      Float temperature = point.getFloat("temperature");
      float humidity = point.getFloat("humidity");
      String readDateString = point.getString("readDate");
      
      
    }
  }
}
