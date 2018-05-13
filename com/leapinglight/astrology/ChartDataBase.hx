package com.leapinglight.astrology;

import com.leapinglight.time.SimpleTime;
import com.leapinglight.time.UTC;
import com.leapinglight.astrology.AstroDefs;

class ChartDataBase
{
	
	public static inline var DefaultHouseSystem = AstroDefs.HOUSES_PLACIDUS; // .HOUSES_PLACIDUS;
	public static inline var TimeZoneDeviceLocal = "DeviceLocal";
	public var TimeZone = TimeZoneDeviceLocal;
	public var Latitude = 51.28;
	public var Longitude = 0.0;
	public var Year = 1978;
	public var Month = 4;
	public var Day = 12;
	public var Hour = 19;
	public var Minute = 20;
	public var HouseSystem = DefaultHouseSystem;
	
	public function getTimeString()	{
		return Std.string(Year) + "/" +
			StringTools.lpad(Std.string(Month),"0",2) + "/" +
			StringTools.lpad(Std.string(Day),"0",2) + " " +
			StringTools.lpad(Std.string(Hour),"0",2) + ":" + StringTools.lpad(Std.string(Minute),"0",2);
	}
	
	public var CountryCode:String;
	public var CountryName:String;
	public var PlaceName:String;
	public var PlaceDescription(get, never):String;
	function get_PlaceDescription() {
		return CountryName + "/" + PlaceName;
	}
	public var PersonName:String;
	public var PersonDescription:String;
	public var CalculatedUtcTime(default, null):SimpleTime;
	public var FileName:String;
	public var FileNameAsName(get, null):String;
	function get_FileNameAsName() {
		return FileName; // should be without extension
	}
	public static function CurrentTransits():ChartData
	{
		var ret = new ChartData();
		var dt = Date.now();
		ret.TimeZone = TimeZoneDeviceLocal;
		ret.Year = dt.getFullYear();
		ret.Month = dt.getMonth();
		ret.Day = dt.getDay();
		ret.Hour = dt.getHours();
		ret.Minute = dt.getMinutes();
		ret.HouseSystem = AstroDefs.HOUSES_NULL;
		return ret;
	}
	
	public function adjustTime(years:Int, months:Int, days:Int, hours:Int, minutes:Int):Void
	{
		var t = SimpleTime.fromYMDHM(Year, Month, Day, Hour, Minute);
		t = UTC.adjustTime(t, years, months, days, hours, minutes, 0);
		Year = t.year;
		Month = t.month;
		Day = t.day;
		Hour = t.hour;
		Minute = t.minute;
	}	
	
	public function setAttribute(attr:String, val:String) {
		///trace("setting " + attr + " to " + val);
		switch (attr) {
			case "latitude":	Latitude = tryParseFloat(val);
			case "longitude":	Longitude = tryParseFloat(val);
			case "countrycode":	CountryCode = StringTools.trim(val);
			case "countryname":	CountryName = StringTools.trim(val);
			case "placename":	PlaceName = StringTools.trim(val);
			case "timezone":	TimeZone = StringTools.trim(val);
			case "year":		Year = tryParseInt(val);
			case "month":		Month = tryParseInt(val);
			case "day":			Day = tryParseInt(val);
			case "hour":		Hour = tryParseInt(val);
			case "minute":		Minute = tryParseInt(val);
			default:
		}
	}

	public function new() 
	{
		Latitude = 51.28;
		Longitude = 0.0;
		CountryCode = "";
		CountryName = "United Kingdom";
		PlaceName = "Greenwich";
		TimeZone = "DeviceLocal";
		PersonName = "";
		PersonDescription = "";
		var dt = Date.now(); // local now
		Year = dt.getFullYear();
		Month = dt.getMonth();
		Day = dt.getDay();
		Hour = dt.getHours();
		Minute = dt.getMinutes();
	}
	
	public static function fromSerialized(data:String) {
		var ret = new ChartDataBase();
		ret.updateFromSerialized(data);
		return ret;
	}
	
	/*public static function fromFile(filename:String) {
		var data = Assets.getText(filename);
		return ChartData.fromSerialized(data);
	}*/

	public function serialize():String
	{
		return
			CountryCode + "\n" +
			CountryName + "\n" +
			PlaceName + "\n" +
			Std.int(Latitude * 100.0) + "\n" +
			Std.int(Longitude * 100.0) + "\n" +
			TimeZone + "\n" +
			Year + "\n" +
			Month + "\n" +
			Day + "\n" +
			Hour + "\n" +
			Minute + "\n" +
			PersonName + "\n" +
			PersonDescription + "\n" +
			Std.string(HouseSystem); 
		//+"\n" +
		  //   PlaceDescription;
	}
	
	static function tryParseInt(s:String) : Int {
		try {
			return Std.parseInt(StringTools.trim(s));
		} catch (e:Dynamic) {
			return -1;
		}
	}
	static function tryParseFloat(s:String) : Float {
		try {
			return Std.parseFloat(StringTools.trim(s));
		} catch (e:Dynamic) {
			return 0.0;
		}
	}
	
	public function updateFromSerialized(data:String):Void
	{
		var d:Array<String> = data.split("\n");
		for (i in 0...d.length)
		//for (int i = 0; i < d.Length; i++)
		{
			var s = d[i];
			switch (i) {
				case 0: CountryCode = StringTools.trim(s);
				case 1: CountryName = StringTools.trim(s);
				case 2: PlaceName = StringTools.trim(s);
				case 3: Latitude = tryParseFloat(s); Latitude = Latitude / 100.0;
				case 4: Longitude = tryParseFloat(s); Longitude = Longitude / 100.0;
				case 5: TimeZone = StringTools.trim(s);
				case 6: Year = tryParseInt(s);
				case 7: Month = tryParseInt(s);
				case 8: Day = tryParseInt(s);
				case 9: Hour = tryParseInt(s); 
				case 10: Minute = tryParseInt(s);
				case 11: PersonName = StringTools.trim(s);
				case 12: PersonDescription = StringTools.trim(s);
				case 13:
					if (s == null || StringTools.trim(s).length == 0)
					{
						HouseSystem = DefaultHouseSystem;
					}
					else
					{
						var h = tryParseInt(StringTools.trim(s));
						HouseSystem = h;
						if (HouseSystem < 0)
						{
							HouseSystem = AstroDefs.HOUSES_NULL;
						}
					}
					break;
				//case 14: PlaceDescription = s; break;
			}
		}
		//HouseSystem = DefaultHouseSystem; // TRALALAL
	}
	
	public function Duplicate()
	{
		var ret = new ChartData();
		ret.TimeZone = TimeZone;
		ret.Latitude = Latitude;
		ret.Longitude = Longitude;
		ret.Year = Year;
		ret.Month = Month;
		ret.Day = Day;
		ret.Hour = Hour;
		ret.Minute = Minute;
		ret.HouseSystem = HouseSystem;
		ret.CountryCode = CountryCode;
		ret.CountryName = CountryName;
		ret.PlaceName = PlaceName;
		//ret.PlaceDescription = PlaceDescription;
		return ret;
	}
	
}