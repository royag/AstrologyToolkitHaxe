package com.leapinglight.astrology;

import com.leapinglight.astrology.AstroDefs;

/**
 * ...
 * @author Roy
 */
class HouseCalc
{
	
	public static inline function eclipticObliquity()
	{
		return 23.448; // Estimation of the ecliptic obliquity
	}
	
	public static function mcAboveAsc(mc:Float, asc:Float) : Bool
	{
		var desc = AstroDefs.filter360(asc + 180.0);
		if (desc > asc)
		{
			return (mc > desc) || (mc < asc);
		}
		else
		{
			return (mc > desc) && (mc < asc);
		}
	}
	
	public static function ascendantFromSideralLatitude(localSideral:Float, latitude:Float)
	{
		var eh = degToRad(eclipticObliquity());

		var ramc = degToRad(localSideral * 15.0);
		var lati = degToRad(latitude);
		var teller = Math.cos(ramc);
		var nevner = ((0.0 - Math.sin(ramc)) * Math.cos(eh) -
				Math.tan(lati) * Math.sin(eh));

		var asc_rad = Math.atan(teller / nevner);
		var asc = radToDeg(asc_rad);
		if (nevner < 0)
		{
			asc += 180.0;
		}
		return AstroDefs.filter360(asc);
	}
	
	public static function mediumCoeliFromSideral(localSideral:Float)
	{
		var eh = degToRad(eclipticObliquity());
		var ramc = degToRad(localSideral * 15.0);
		var mc_rad = Math.atan(Math.tan(ramc) / Math.cos(eh));
		var mc = radToDeg(mc_rad);
		if (mc < 0)
		{
			mc += 180;
		}
		if (radToDeg(ramc) > 180)
		{
			mc += 180;
		}
		return AstroDefs.filter360(mc);
	}
	
	public static function calcHouses(houses:Array<Float>, positions:PlanetPositions, houseSystem:Int, latitude:Float, longitude:Float)
	{
		var localSideral = calculateLocalSideral(positions.gmt0sideralTime, positions.gmtTime, longitude);
		switch (houseSystem)
		{
			case AstroDefs.HOUSES_NULL:
				calcHousesNULL(houses);
			case AstroDefs.HOUSES_EQUAL_ASC:
				calcHousesEqualASC(houses, positions.ascendant);
			case AstroDefs.HOUSES_WHOLE_VEDIC:
				calcHousesWholeVedic(houses, positions.ascendant);
			case AstroDefs.HOUSES_PORPHYRY:
				calcHousesPorphyry(houses, positions.ascendant, positions.mediumCoeli);
			case AstroDefs.HOUSES_PLACIDUS:
				calcHousesPlacidus(houses, positions.ascendant, positions.mediumCoeli, localSideral, latitude);
			case AstroDefs.HOUSES_KOCH:
				calcHousesKoch(houses, positions.ascendant, positions.mediumCoeli, localSideral, latitude);
			default:
				calcHousesNULL(houses);
		}
	}	
	

	public static function cuspPlacidus(deg:Float, FF:Float, fNeg:Bool, localSideral:Float, latitude:Float)
	{
		var AA = degToRad(latitude);
		if (AA == 0) {
			AA = 0.0001;
		}
		var RA = degToRad(localSideral * 15.0);
		var OB = degToRad(eclipticObliquity());
		var LO:Float;
		var R1:Float;
		var XS:Float;
		var X:Float;
		var i:Int;
		R1 = RA + radToDeg(deg);
		X = (fNeg ? 1.0 : -1.0);
		i = 1;
		while (i <= 10) {
			/* This formula works except at 0 latitude (AA == 0.0). */
			XS = X*Math.sin(R1)*Math.tan(OB)*Math.tan(AA == 0.0 ? 0.0001 : AA);
			XS = Math.acos(XS);
			if (XS < 0.0) {
				XS += Math.PI; //rPi;
			}
			R1 = RA + (fNeg ? Math.PI/*rPi*/-(XS / FF) : (XS / FF));
			i++;
		}
		LO = Math.atan(Math.tan(R1)/Math.cos(OB));
		if (LO < 0.0) {
			 LO += Math.PI; //rPi;
		}
		if (Math.sin(R1) < 0.0) {
			LO += Math.PI;//rPi;
		}
		return radToDeg(LO);
	}
	
	public static inline function emptyHouseArray() : Array<Float> {
		return [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
	}
	
	public static function calcHousesPlacidus(houses:Array<Float>, asc:Float, mc:Float, localSideral:Float, latitude:Float):Void
	{
		houses[1 - 1] = asc;
		houses[4 - 1] = mc + 180.0;
		houses[5 - 1] = cuspPlacidus(30.0, 3.0, false, localSideral, latitude) + 180.0;
		houses[6 - 1] = cuspPlacidus(60.0, 1.5, false, localSideral, latitude) + 180.0;
		houses[2 - 1] = cuspPlacidus(120.0, 1.5, true, localSideral, latitude);
		houses[3 - 1] = cuspPlacidus(150.0, 3.0, true, localSideral, latitude);
		var i = 0;
		while (i < 12) {
			if (i < 6) {
				houses[i] = AstroDefs.filter360(houses[i]/*+is.rSid*/);
			} else {
				houses[i] = AstroDefs.filter360(houses[i - 6] + 180.0); //rDegHalf);
			}
			i++;
		}
	}
	
	public static function calcHousesKoch(houses:Array<Float>, asc:Float, mc:Float, localSideral:Float, latitude:Float):Void
	{
		var A1:Float, A2:Float, A3:Float, KN:Float, D:Float, X:Float;
		
		var AA = degToRad(latitude);
		if (AA == 0) {
			AA = 0.0001;
		}
		var RA = degToRad(localSideral * 15.0);
		var OB = degToRad(eclipticObliquity());
		A1 = Math.sin(RA) * Math.tan(AA) * Math.tan(OB);
		A1 = Math.asin(A1);
		var i = 1;
		while (i <= 12) {
			D = AstroDefs.filter360(60.0+30.0*i);
			A2 = D/90.0-1.0; KN = 1.0;
			if (D >= 180.0) {
				KN = -1.0;
				A2 = D/90.0-3.0;
			}
			A3 = degToRad(AstroDefs.filter360((radToDeg(RA) + D + A2 * radToDeg(A1))));
			X = Angle(Math.cos(A3) * Math.cos(OB) - KN * Math.tan(AA) * Math.sin(OB), Math.sin(A3));
			houses[i - 1] = AstroDefs.filter360(radToDeg(X));
			i++;
		}
	}
	
	public static function calcHousesNULL(houses:Array<Float>):Void
	{
		var i = 0;
		while (i < 12) 
		{
			houses[i] = i * 30;
			i++;
		}
	}

	public static function calcHousesEqualASC(houses:Array<Float>, asc:Float):Void
	{
		var i = 0;
		while (i < 12) 
		{
			if (i == 0)
			{
				houses[i] = asc;
			}
			else
			{
				houses[i] = AstroDefs.filter360(houses[i - 1] + 30);
			}
			i++;
		}
	}

	public static function calcHousesWholeVedic(houses:Array<Float>, asc:Float):Void
	{
		var i = 0;
		while (i < 12) 
		{
			if (i == 0)
			{
				houses[i] = AstroDefs.signForPosition(asc) * 30.0;
			}
			else
			{
				houses[i] = AstroDefs.filter360(houses[i - 1] + 30);
			}
			i++;
		}
	}

	public static function calcHousesPorphyry(houses:Array<Float>, asc, mc):Void
	{
		var fourthQuadSize = AstroDefs.calcDistance(mc, asc);
		var signSizeQ4 = fourthQuadSize / 3.0;
		var firstQuadSize = 180 - fourthQuadSize;
		var signSizeQ1 = firstQuadSize / 3.0;
		houses[0] = asc;
		houses[1] = AstroDefs.filter360(asc + signSizeQ1);
		houses[2] = AstroDefs.filter360(asc + signSizeQ1 * 2);
		var ic = houses[3] = AstroDefs.filter360(mc + 180.0); // IC/4th
		houses[4] = AstroDefs.filter360(ic + signSizeQ4);
		houses[5] = AstroDefs.filter360(ic + signSizeQ4 * 2);
		var dec = houses[6] = AstroDefs.filter360(asc + 180.0); // Descendant/7th
		houses[7] = AstroDefs.filter360(dec + signSizeQ1);
		houses[8] = AstroDefs.filter360(dec + signSizeQ1 * 2);
		houses[9] = mc; // MC/10th
		houses[10] = AstroDefs.filter360(mc + signSizeQ4);
		houses[11] = AstroDefs.filter360(mc + signSizeQ4 * 2);
	}
	
	public static function houseOfPosition(pos:Float, houses:Array<Float>):Int
	{
		var i = AstroDefs.HOUSE_1;
		while (i <= AstroDefs.HOUSE_12)
		{
			var cur = houses[i];
			var next = (i == AstroDefs.HOUSE_12 ? houses[AstroDefs.HOUSE_1] : houses[i + 1]);
			if (cur < next)
			{
				if (pos >= cur && pos < next)
				{
					return i;
				}
			}
			else
			{
				if (pos >= cur || pos < next)
				{
					return i;
				}
			}
		}
		return -1; // shouldn't happen
	}	
	
	public static function calculateLocalSideral(gmt0sideraltime:Float, newGmtTime:Float, longitude:Float):Float
	{
		// 24hours in normal time gives 3 mins 56.6 seconds sideral time.
		// hms2hours(0,3,56.6) / 24) gives 0.00273843
		var hourLength = 0.00273843;
		var localSideral = newGmtTime + gmt0sideraltime +
				(newGmtTime * hourLength) +
				AstroDefs.hmsToHours(0, longitude * 4, 0);
		// [above:] the sun spends 4 minutes to pass each of the 360 degrees
		// (360*4=1440mins 1440/60=24hours):
		if (localSideral > 24)
		{
			localSideral -= 24;
		}
		return localSideral;
	}
	
	public static function calcAscAndMc(pos:PlanetPositions, latitude:Float, longitude:Float):Void
	{
		var localSideral = calculateLocalSideral(pos.gmt0sideralTime, pos.gmtTime, longitude);
		var asc = ascendantFromSideralLatitude(localSideral, latitude);
		var mc = mediumCoeliFromSideral(localSideral);
		if (!mcAboveAsc(mc, asc))
		{
			if ((latitude > 66) || (latitude < -66))
			{
				// We assume this is due to the weird behaviour of the
				// ascendant in the far north (/south ?):
				// We turn the ascendant around 180 degrees,
				// some say we should also turn medium coeli
				asc = AstroDefs.filter360(asc + 180);
			}
			else
			{
				//throw new AstroException("Something wrong with ascendant calculation!");
				// -----------------
				// Hmmm for Hillary Clinton, turning the MC around seems to fix the deal...
				mc = AstroDefs.filter360(mc + 180);
				//return; // do nothing
			}
		}
		pos.ascendant = asc;
		pos.mediumCoeli = mc;
	}
	
	
	
	
	
	
	/////////////////////////////////
	/////////////// MATH stuff:
	/////////////////////////////////
	
	public static function Angle(x, y)
	{
	  var a:Float;

	  if (x != 0.0) {
		if (y != 0.0)
		  a = Math.atan(y/x);
		else
		  a = x < 0.0 ? Math.PI : 0.0;
	  } else
		a = y < 0.0 ? -(Math.PI/2) : (Math.PI/2);
	  if (a < 0.0)
		a += Math.PI;
	  if (y < 0.0)
		  a += Math.PI;
	  return a;
	}	
	
	
	static inline function degToRad(deg:Float)
	{
		return deg * Math.PI / 180.0;
	}
	static inline function cot(n:Float)
	{
		return Math.cos(n) / Math.sin(n);
	}
	static inline function acot(n:Float)
	{
		return Math.atan(1 / n);
	}

	static inline function radToDeg(rad:Float)
	{
		return rad * 180.0 / Math.PI;
	}

	static inline function dsin(n)
	{
		return Math.sin(degToRad(n));
	}

	static inline function dtan(n)
	{
		return Math.tan(degToRad(n));
	}

	static inline function dcot(n)
	{
		return cot(degToRad(n));
	}

	static inline function dacot(n)
	{
		return radToDeg(acot(n));
	}

	static inline function dcos(n)
	{
		return Math.cos(degToRad(n));
	}

	static inline function datan(n)
	{
		return radToDeg(Math.atan(n));
	}

	static inline function dasin(n)
	{
		return radToDeg(Math.asin(n));
	}	
	
}