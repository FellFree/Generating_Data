import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.text.SimpleDateFormat;
import java.text.ParseException;

class Point {
  
  private int id;
  private String name;
  private float temperature;
  private float humidity;
  private String readDateString;
  private Calendar readDate;
  
  private SimpleDateFormat simpleFormatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

  Point(int id, String name, float temperature, float humidity, Calendar readDate) {
    
    this.id = id;
    this.name = name;
    this.temperature = temperature;
    this.humidity = humidity;
    
    this.readDate = readDate;
    
    Date date = readDate.getTime();
    this.readDateString = simpleFormatter.format(date);
  }
  
  Point (JSONObject JSONPoint) {
    
    this.id = JSONPoint.getInt("id");
    this.name = JSONPoint.getString("name");
    this.temperature = JSONPoint.getFloat("temperature");
    this.humidity = JSONPoint.getFloat("humidity");
    this.readDateString = JSONPoint.getString("readDateString");
    
    Date date;
    
    try {
      date = simpleFormatter.parse(this.readDateString);
      this.readDate.setTime(date);
    } catch (ParseException e) {
      print(e.getMessage());
      date = null;
    }
    
    println(this.toString());
  }

  String toString() {
    
    Date date = readDate.getTime();

    return "Date: " + simpleFormatter.format(date) + " " +
      this.name + ": " +
      "T: " + this.temperature + " " +
      "H: " + this.humidity;
  }
}
