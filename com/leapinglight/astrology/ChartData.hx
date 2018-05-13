package com.leapinglight.astrology;
import com.leapinglight.time.SimpleTime;
import com.leapinglight.time.UTC;
import haxe.ds.StringMap.StringMap;
import com.leapinglight.time.TZInfo;
import com.leapinglight.astrology.AstroDefs;
import com.leapinglight.astrology.AstroLoader;

/**
 * ...
 * @author Roy
 */
class ChartData extends ChartDataBase
{
	static var preloadedYear:EphemYearHolder = new EphemYearHolder();
	static var preloadedYear2:EphemYearHolder = new EphemYearHolder();
	static var lastUsed:Int = -1;
		
		
	
	
	static var zoneCache = new StringMap<TZInfo>(); // IDictionary<string, TZInfo> zoneCache = new Dictionary<string, TZInfo>();	
	
	
	public function new() {
		super();
	}
	
	public static function fromSerialized(data:String) {
		var ret = new ChartData();
		ret.updateFromSerialized(data);
		return ret;
	}
	
	public function CalculateHouses(pp:PlanetPositions):Array<Float> {
		var houses = HouseCalc.emptyHouseArray();
		HouseCalc.calcHouses(houses, pp, HouseSystem, Latitude, Longitude);
		return houses;
	}		
		
	public function CalculatePositions():PlanetPositions
	{
		return CalculatePositions2(false);
	}
	
	public function CalculatePositions2(noPlanets:Bool):PlanetPositions
	{
		//AstroDefs.EPHEM_YEAR preloadedYear = null;
		//TZInfo.SimpleTime st;
		if (TimeZone != ChartDataBase.TimeZoneDeviceLocal)
		{
			var tz:TZInfo;
			var tzone = StringTools.trim(TimeZone);
			if (zoneCache.exists(tzone))
			{
				tz = zoneCache.get(tzone);
			}
			else
			{
				tz = new TZInfo(tzone);
				zoneCache.set(tzone, tz);
			}
			//TZInfo tz = new TZInfo(TimeZone);
			CalculatedUtcTime = tz.toUTC(Year, Month, Day, Hour, Minute);
		}
		else
		{
			
			//DateTime dt = new DateTime(Year, Month, Day, Hour, Minute, 0, DateTimeKind.Local);
			//DateTime utc = dt.ToUniversalTime();
			var dt = new Date(Year, Month, Day, Hour, Minute, 0);
			// TODO : Convert local to utc-time... how ?
			CalculatedUtcTime = new SimpleTime();
			CalculatedUtcTime.year = dt.getFullYear();
			CalculatedUtcTime.month = dt.getMonth();
			CalculatedUtcTime.day = dt.getDay();
			CalculatedUtcTime.hour = dt.getHours();
			CalculatedUtcTime.minute = dt.getMinutes();			
		}

		var utcTime = CalculatedUtcTime;
		var pp:PlanetPositions = AstroDefs.emptyPositions();
		if (noPlanets)
		{
			pp = AstroDefs.NULLpositions();
			pp.gmtTime = AstroDefs.hmsToHours(utcTime.hour, utcTime.minute, 0);
			pp.gmt0sideralTime = AstroDefs.calcGmtSideralTime(utcTime.year, utcTime.month, utcTime.day, 0, 0);
		}
		else
		{

			//AstroDefs.EPHEM_YEAR yearCache = null;
			if (preloadedYear.year != null && preloadedYear.year[0].year == utcTime.year)
			{
				lastUsed = 1;
				//yearCache = preloadedYear;
			}
			else if (preloadedYear2.year != null && preloadedYear2.year[0].year == utcTime.year)
			{
				lastUsed = 2;
				//yearCache = preloadedYear2;
			}
			else
			{
				if (lastUsed == 1)
				{
					lastUsed = 2;
					//yearCache = preloadedYear2;
				}
				else
				{
					lastUsed = 1;
					//yearCache = preloadedYear;
				}
			}

			
			if (lastUsed == 1)
			{
				pp = AstroLoader.calculateRecForGmt(
					utcTime.year, utcTime.month, utcTime.day, utcTime.hour, utcTime.minute, 0,
					preloadedYear);
			}
			else
			{
				pp = AstroLoader.calculateRecForGmt(
					utcTime.year, utcTime.month, utcTime.day, utcTime.hour, utcTime.minute, 0,
					preloadedYear2);
			}

		}

		if (HouseSystem != AstroDefs.HOUSES_NULL)
		{
			//trace(Latitude);
			HouseCalc.calcAscAndMc(pp, Latitude, Longitude);
		}
		else
		{
			var houses = CalculateHouses(pp);
			pp.ascendant = houses[0];
			pp.mediumCoeli = houses[9];
		}
		return pp;
	}		
	
	
}