import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.text.SimpleDateFormat;

class Point {
  private int id;
  private String name;
  private float temperature;
  private float humidity;
  private String readDateString;
  private Calendar readDate;

  Point(int id, String name, float temperature, float humidity, Calendar readDate) {
    this.id = id;
    this.name = name;
    this.temperature = temperature;
    this.humidity = humidity;

    this.readDate = readDate;
    
    SimpleDateFormat simpleFormatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
    Date date = readDate.getTime();
    
    this.readDateString = simpleFormatter.format(date);
  }

  String toString() {

    SimpleDateFormat simpleFormatter = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
    Date date = readDate.getTime();

    return "Date: " + simpleFormatter.format(date) + " " +
      this.name + ": " +
      "T: " + this.temperature + " " +
      "H: " + this.humidity;
  }
}
