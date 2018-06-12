import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.text.SimpleDateFormat;

public Points points;
public Calendar sinceDate, toDate;
public int HInterval = 1;
public JSONArray JSONPoints, tempJSONPoints;

void setup() {

  points = new Points();

  toDate = Calendar.getInstance();
  sinceDate = Calendar.getInstance();
  sinceDate.set(2018, 4, 1);

  JSONPoints = new JSONArray();

  //println("sinceDate: " + new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(sinceDate.getTime()));
  //println("toDate: " + new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(toDate.getTime()));

  //println(sinceDate.before(toDate));
  //sinceDate.add(Calendar.HOUR, HInterval);

  //println("sinceDate: " + new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(sinceDate.getTime()));
  //println("toDate: " + new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(toDate.getTime()));
  //println(sinceDate.before(toDate));

  for (; sinceDate.before(toDate); sinceDate.add(Calendar.HOUR, HInterval)) {

    println(new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(sinceDate.getTime()));

    points.generatePoints(new String[]{"T1L", "T2L", "T3L", "T4L", "T5L", "T11L", "T21L", "T31L", "T41L", "T51L", 
      "T1P", "T2P", "T3P", "T4P", "T5P", "T11P", "T21P", "T31P", "T41P", "T51P"}, 36, 120, sinceDate);
    tempJSONPoints = points.getJSONPoints();

    for (int i = 0; i < tempJSONPoints.size(); i++) {
      JSONPoints.append(tempJSONPoints.getJSONObject(i));
    }
  }

  saveJSONArray(JSONPoints, "data/points.json");
}

void draw() {
}
