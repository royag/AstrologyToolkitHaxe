package com.leapinglight.astrology.test;
import com.leapinglight.astrology.ChartData;
import haxe.unit.TestCase;
import com.leapinglight.io.Assets;
import com.leapinglight.astrology.AstroDefs;
import com.leapinglight.astrology.HouseCalc;

/**
 * ...
 * @author Roy
 */
class ChartTest extends TestCase
{
	function assertPositions(fn:String, planetPos:Array<String>) {
		var data = Assets.getText("assets/vip/" + fn);
		var chart:ChartData = ChartData.fromSerialized(data);
		var pp = chart.CalculatePositions();
		for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI+1) {
			assertEquals(planetPos[p], AstroDefs.positionToChar6(AstroDefs.positionOfPlanet(pp, p)));
		}
	}
	
	function assertHouses(fn:String, housePos:Array<Float>) {
		var data = Assets.getText("assets/vip/" + fn);
		var chart:ChartData = ChartData.fromSerialized(data);
		var pp = chart.CalculatePositions();
		var houses = chart.CalculateHouses(pp);
		for (p in AstroDefs.HOUSE_1...AstroDefs.HOUSE_12+1) {
			assertEquals(Math.round(housePos[p]), Math.round(houses[p]));
		}
	}	
	
	public function testAllVipChartsShouldLoad() {
		var index = Assets.getText("assets/vip/index.txt");
		var vips:Array<String> = index.split("\n");
		var tst = "\n";
		for (fn in vips) {
			fn = StringTools.trim(fn);
			if (fn.length == 0) {
				break;
			}
			var data = Assets.getText("assets/vip/" + fn);
			var chart:ChartData = ChartData.fromSerialized(data);
			var pp = chart.CalculatePositions();
			var houses = chart.CalculateHouses(pp);
			assertTrue(pp.ascendant > 0.0 && pp.ascendant < 360.0);
		}
	}
	
	static inline var LAT_Drammen = 59.74;
	static inline var LONG_Drammen = 10.21;	
	
	public function testSetAttribute() {
		/*
		 * 		Latitude = 51.28;
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
		 */
		var chart:ChartData = new ChartData();
		chart.setAttribute("latitute", Std.string(LAT_Drammen));
		chart.setAttribute("longitude", Std.string(LONG_Drammen));
		chart.setAttribute("countrycode", "NO");
		chart.setAttribute("countryname", "Norway");
		chart.setAttribute("placename", "Drammen");
		chart.setAttribute("timezone", "Europe/Oslo");
		chart.setAttribute("year", "1978");
		chart.setAttribute("month", "4");
		chart.setAttribute("day", "12");
		chart.setAttribute("hour", "19");
		chart.setAttribute("minute", "20");
		var rec = chart.CalculatePositions();
		var houses = chart.CalculateHouses(rec);

		assertEquals(202, Math.floor(houses[0]));
		assertEquals(227, Math.floor(houses[1]));
		assertEquals(261, Math.round(houses[2]));
		assertEquals(303, Math.floor(houses[3]));
		assertEquals(339, Math.round(houses[4]));
		assertEquals(4, Math.floor(houses[5]));
		
		assertEquals(22, Math.floor(houses[6]));
		assertEquals(47, Math.floor(houses[7]));
		assertEquals(81, Math.round(houses[8]));
		assertEquals(123, Math.floor(houses[9]));
		assertEquals(159, Math.round(houses[10]));
		assertEquals(184, Math.floor(houses[11]));	
		
		assertEquals(13, Math.round(rec.gmt0sideralTime));
		assertEquals(18, Math.round(rec.gmtTime));
		assertEquals(22, Math.round(rec.sun));
		assertEquals(81, Math.round(rec.moon));
		assertEquals(20, Math.round(rec.mercury));
		assertEquals(42, Math.round(rec.venus));
		assertEquals(120, Math.round(rec.mars));
		assertEquals(90, Math.round(rec.jupiter));
		assertEquals(143, Math.round(rec.saturn));
		assertEquals(225, Math.round(rec.uranus));
		assertEquals(258, Math.round(rec.neptune));
		assertEquals(195, Math.round(rec.pluto));
		assertEquals(185, Math.round(rec.node));
		assertEquals(3, rec.weekday);		
	}
	
	
	/*
	public function testVip() {
		var index = Assets.getText("assets/vip/index.txt");
		var vips:Array<String> = index.split("\n");
		var tst = "\n";
		for (fn in vips) {
			fn = StringTools.trim(fn);
			if (fn.length == 0) {
				break;
			}
			var data = Assets.getText("assets/vip/" + fn);
			var chart:ChartData = ChartData.fromSerialized(data);
			if (chart.Year < 1902) {
				trace("oopps");
			}
			var pp = chart.CalculatePositions();
			var houses = chart.CalculateHouses(pp);
			//trace(chart.PersonName);
			//trace(AstroDefs.stringFromPositions(pp));
			tst += "assertPositions(\"" + fn + "\",[";
			for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI+1) {
				tst += "\"" + AstroDefs.positionToChar6(AstroDefs.positionOfPlanet(pp, p)) + "\"";
				if (p != AstroDefs.MEDIUM_COELI) tst += ",";
			}		
			tst += "]);\n";
			
			assertTrue(pp.ascendant > 0.0 && pp.ascendant < 360.0);
		}
		trace(tst);
	}	 */
	
}