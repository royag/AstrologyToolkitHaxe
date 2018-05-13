package com.leapinglight.astrology;

 typedef EPHEM_REC = {
	dummy : Int, // Uint16
    weekday: Int,// Uint16
    sid_h: Int,// Uint16
    sid_m: Int,// Uint16
    sid_s: Int,// Uint16
    gmt: Int,// Uint16
    day: Int,// Uint16
    month: Int,// Uint16
    year: Int,// UInt32
    sun: Int,// Uint16
    moon: Int,// Uint16
    mercury: Int,// Uint16
    venus: Int,// Uint16
    mars: Int,// Uint16
    jupiter: Int,// Uint16
    saturn: Int,// Uint16
    uranus: Int,// Uint16
    neptune: Int,// Uint16
    pluto: Int,// Uint16
    node: Int,// Uint16
 }
 
 typedef EPHEM_YEAR = Array<EPHEM_REC>
 
 typedef PlanetPositions = {
    weekday : Int,
    sideralTime : Float,
    gmt0sideralTime : Float,
    gmtTime : Float,
    sun : Float,
    moon : Float,
    mercury : Float,
    venus : Float,
    mars : Float,
    jupiter : Float,
    saturn : Float,
    uranus : Float,
    neptune : Float,
    pluto : Float,
    node : Float,
    ascendant : Float,
    mediumCoeli : Float,
	houses : Array<Float>
 }
 
 typedef ChartRgb = {
	r : Float,
	g : Float,
	b : Float,
}
 
class AstroDefs 
{

	public inline static var SUN = 0;
    public inline static var MOON = 1;
    public inline static var MERCURY = 2;
    public inline static var VENUS = 3;
    public inline static var MARS = 4;
    public inline static var JUPITER = 5;
    public inline static var SATURN = 6;
    public inline static var URANUS = 7;
    public inline static var NEPTUNE = 8;
    public inline static var PLUTO = 9;
    public inline static var NODE = 10;
    public inline static var ASCENDANT = 11;
    public inline static var MEDIUM_COELI = 12;
	
	public static var PLANETS = [
        SUN, MOON, MERCURY, VENUS, MARS, JUPITER, SATURN, URANUS, NEPTUNE, PLUTO, NODE
	];
	
    public inline static var ARIES = 0;
    public inline static var TAURUS = 1;
    public inline static var GEMINI = 2;
    public inline static var CANCER = 3;
    public inline static var LEO = 4;
    public inline static var VIRGO = 5;
    public inline static var LIBRA = 6;
    public inline static var SCORPIO = 7;
    public inline static var SAGGITARIUS = 8;
    public inline static var CAPRICORN = 9;
    public inline static var AQUARUIS = 10;
    public inline static var PISCES = 11;


    public static var SIGNS = [
            ARIES,TAURUS,GEMINI,CANCER,LEO,VIRGO,LIBRA,SCORPIO,SAGGITARIUS,CAPRICORN,AQUARUIS,PISCES];


	public static inline var HOUSES_NULL = 0;
	public static inline var HOUSES_EQUAL_ASC = 1;
	public static inline var HOUSES_WHOLE_VEDIC = 2;
	public static inline var HOUSES_PORPHYRY = 3;
	public static inline var HOUSES_PLACIDUS = 4;
	public static inline var HOUSES_KOCH = 5;

	public static inline var HOUSE_1 = 0;
	public static inline var HOUSE_2 = 1;
	public static inline var HOUSE_3 = 2;
	public static inline var HOUSE_4 = 3;
	public static inline var HOUSE_5 = 4;
	public static inline var HOUSE_6 = 5;
	public static inline var HOUSE_7 = 6;
	public static inline var HOUSE_8 = 7;
	public static inline var HOUSE_9 = 8;
	public static inline var HOUSE_10 = 9;
	public static inline var HOUSE_11 = 10;
	public static inline var HOUSE_12 = 11;
	
	public static var HOUSE_NAMES = [
		"1st", "2nd", "3rd", "4th", "5th", "6th",
		"7th", "8th", "9th", "10th", "11th", "12th"
	];

	public static var HOUSE_SYSTEM_NAMES = [
		"NULL", "Equal", "Whole", "Porphyry", "Placidus", "Koch"
	];			
			
    public inline static var NUM_ASPECTS = 10;
    public inline static var NUM_SIGNS = 12;
    public inline static var NUM_PLANETS = 11;

    public static var ASPECTS = [
            0,30,45,60,72,90,120,135,150,180
        ];

    public static var ASPECT_NAMES = [
            "Conjunction", "Semisextile", "Semisquare", "Sextile", "Quintile", "Square",
            "Trine", "Sesquisquare", "Quincunx", "Opposition"
        ];


    public static var DEFAULT_ORBS = [
            9.0, // Conjunction
            2.0, // Semisextile
            2.0, // Semisquare
            4.0, // Sextile
            1.0, // Quintile
            9.0, // Square
            9.0, // Trine
            2.0, // Sesquisquare
            2.0, // Quincunx
            9.0  // Opposition
        ];

    public static var DEFAULT_TRANSIT_ORBS = [
            4.0, // Conjunction
            0.5, // Semisextile
            0.5, // Semisquare
            1.0, // Sextile
            0.5, // Quintile
            2.0, // Square
            2.0, // Trine
            0.5, // Sesquisquare
            0.5, // Quincunx
            3.0  // Opposition
        ];	
	
	public static var chart_rgb_red:ChartRgb = {r : 0.0, g:1.0, b:0.0};
    public static var chart_rgb_green:ChartRgb = {r : 0.0, g:1.0, b:0.0};
    public static var chart_rgb_blue:ChartRgb = {r : 0.0, g:0.0, b:1.0};
    public static var chart_rgb_black:ChartRgb = { r : 0.0, g:0.0, b:1.0 };
	
    public static var colors:Array<ChartRgb> = [
            chart_rgb_blue, // 0
            chart_rgb_blue, // 20
            chart_rgb_red,  // 45
            chart_rgb_blue, // 60
            chart_rgb_black,    // 72
            chart_rgb_red,  // 90
            chart_rgb_blue, // 120
            chart_rgb_green,    // 135
            chart_rgb_green,    // 150
            chart_rgb_red   // 180
        ];
		
    public inline static var ELEM_FIRE = 0;
    public inline static var ELEM_AIR = 1;
    public inline static var ELEM_EARTH = 2;
    public inline static var ELEM_WATER = 3;

    public static var SIGN_AND_HOUSE_ELEMENTS = [
            ELEM_FIRE, ELEM_EARTH, ELEM_AIR, ELEM_WATER,
            ELEM_FIRE, ELEM_EARTH, ELEM_AIR, ELEM_WATER,
            ELEM_FIRE, ELEM_EARTH, ELEM_AIR, ELEM_WATER,
            ELEM_FIRE, ELEM_EARTH, ELEM_AIR, ELEM_WATER,
    ];


    public static var EPHEM_DAYS_PER_MONTH = [
            31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
    ];

    public static var SIGN_NAMES = [
            "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Saggitarius", "Capricorn", "Aquarius", "Pisces"
    ];

    public static var SIGN_SHORT_NAMES = [
            "Ar","Ta","Gm","Cn","Le","Vi","Li","Sc","Sg","Cp","Aq","Pi"
    ];

    public static var PLANET_NAMES = [
            "Sun", "Moon", "Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Node", "Ascendant", "MC"
    ];

    public static var PLANET_FULL_NAMES = [
            "Sun", "Moon", "Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "North Node", "Ascendant", "Medium Coeli"
    ];
		
	
	/*
	 *     sun : Float,
    moon : Float,
    mercury : Float,
    venus : Float,
    mars : Float,
    jupiter : Float,
    saturn : Float,
    uranus : Float,
    neptune : Float,
    pluto : Float,
    node : Float,
    ascendant : Float,
    mediumCoeli : Float,
	
	
	positionToChar6
	 */ 
	
	public static function stringFromPositions(pp:PlanetPositions) {
		var s = "";
		for (p in SUN...MEDIUM_COELI) {
			s+= PLANET_NAMES[p] + " in " + positionToChar6(positionOfPlanet(pp, p)) + ", ";
		}
		return s;
	}
	
	
	
		
	
	public static function ephem_nameOfAspect(aspect:Int) : String
        {
			var i = 0;
            while ( i < 10)
            {
                if (ASPECTS[i] == aspect)
                {
                    return ASPECT_NAMES[i];
                }
				i += 1;
            }
            return "";
        }

        public static function signForPosition(pos:Float) : Int
        {
            return Std.int(Math.floor(pos / 30.0));
        }

        public static function signPosForPosition(pos:Float) : Float
        {
            return pos - (signForPosition(pos) * 30.0);
        }

        public static function signDegForPosition(pos:Float) : Int
        {
            var sp = signPosForPosition(pos);
            return Std.int(Math.floor(sp));
        }

        public static function signCDegForPosition(pos:Float) : Int
        {
            var sp = signPosForPosition(pos);
            var sd = signDegForPosition(pos);
            return Std.int(Math.floor((sp - sd) * 100));
        }

        public static function positionToChar6(pos:Float):String
        {
            var degChar = "";
            var deg = signDegForPosition(pos);
            if (deg < 10)
            {
                degChar += "0" + Std.string(deg);
            }
            else
            {
                degChar += Std.string(deg);
            }

            var cdegChar = "";
            var cdeg = signCDegForPosition(pos);
            if (cdeg < 10)
            {
                cdegChar += "0" + Std.string(cdeg);
            }
            else
            {
                cdegChar += Std.string(cdeg);
            }

            var sign = signForPosition(pos);

            return degChar + SIGN_SHORT_NAMES[sign] + cdegChar;
        }

        public static function positionOfPlanetInRec(rec:EPHEM_REC, planet:Int):Float
        {
            var pos = 0;
            switch (planet)
            {
                case SUN: pos = rec.sun; 
                case MOON: pos = rec.moon; 
                case MERCURY: pos = rec.mercury; 
                case VENUS: pos = rec.venus;
                case MARS: pos = rec.mars; 
                case JUPITER: pos = rec.jupiter; 
                case SATURN: pos = rec.saturn; 
                case URANUS: pos = rec.uranus; 
                case NEPTUNE: pos = rec.neptune; 
                case PLUTO: pos = rec.pluto; 
                case NODE: pos = rec.node; 
            }
            return pos / 100.0;
        }

        public static function setPosition(rec:PlanetPositions, planet:Int, pos:Float) : Void
        {
            switch (planet)
            {
                case SUN: rec.sun = pos; 
                case MOON: rec.moon = pos; 
                case MERCURY: rec.mercury = pos; 
                case VENUS: rec.venus = pos; 
                case MARS: rec.mars = pos; 
                case JUPITER: rec.jupiter = pos; 
                case SATURN: rec.saturn = pos; 
                case URANUS: rec.uranus = pos; 
                case NEPTUNE: rec.neptune = pos; 
                case PLUTO: rec.pluto = pos; 
                case NODE: rec.node = pos; 
                case ASCENDANT: rec.ascendant = pos;
                case MEDIUM_COELI: rec.mediumCoeli = pos; 
            }
        }

        public static function positionOfPlanet(rec:PlanetPositions, planet:Int):Float
        {
            var pos = 0.0;
            switch (planet)
            {
                case SUN: pos = rec.sun; 
                case MOON: pos = rec.moon; 
                case MERCURY: pos = rec.mercury;
                case VENUS: pos = rec.venus;
                case MARS: pos = rec.mars; 
                case JUPITER: pos = rec.jupiter; 
                case SATURN: pos = rec.saturn;
                case URANUS: pos = rec.uranus;
                case NEPTUNE: pos = rec.neptune;
                case PLUTO: pos = rec.pluto; 
                case NODE: pos = rec.node;
                case ASCENDANT: pos = rec.ascendant;
                case MEDIUM_COELI: pos = rec.mediumCoeli;
            }
            return pos;
        }

        public static function hmsToHours(h:Float, m:Float, s:Float):Float
        {
            return (h + (m / 60.0) + (s / (60.0 * 60.0)));
        }

        public static function filter360(n:Float):Float
        {
            if (n >= 360.0)
            {
                return n - 360.0;
            }
            if (n < 0.0)
            {
                return n + 360.0;
            }
            return n;
        }

	public static function dayNoFromMonthDay(month:Int, day:Int) : Int
	{
		if (month == 1)
		{
			return day - 1;
		}
		else if (month > 1 && month <= 12)
		{
			var daysInPassedMonths = 0;
			var i = 0;
			while (i < month - 1)
			{
				daysInPassedMonths += EPHEM_DAYS_PER_MONTH[i];
				i++;
			}
			return daysInPassedMonths + day - 1;
		}
		else
		{
			return -1;
		}
	}
	
	public static function calculateMeanFloat(a:Float, b:Float, percentAfterA:Float):Float
        {
            if (a > (b + 180.0)) // Kind of a hack..!.!
            {
                b += 360.0;
            }
            var res = a + (((b - a) * percentAfterA) / 100.0);
            if (res >= 360.0)
            {
                res -= 360.0;
            }
            return res;
        }

        public static function positionsForEphemRec(rec:EPHEM_REC):PlanetPositions
        {
			var sid = hmsToHours(rec.sid_h, rec.sid_m, rec.sid_s);
            return {
            sideralTime : sid,
            gmt0sideralTime : sid,
            gmtTime : 0.0,
            weekday : rec.weekday,
            sun : rec.sun / 100.0,
            moon : rec.moon / 100.0,
            mercury : rec.mercury / 100.0,
            venus : rec.venus / 100.0,
            mars : rec.mars / 100.0,
            jupiter : rec.jupiter / 100.0,
            saturn : rec.saturn / 100.0,
            uranus : rec.uranus / 100.0,
            neptune : rec.neptune / 100.0,
            pluto : rec.pluto / 100.0,
            node : rec.node / 100.0,
            ascendant : 0.0,
            mediumCoeli : 270.0,
			houses : null
			}
        }

        public static function NULLpositions() : PlanetPositions
        {
            return {
            sideralTime : 0.0,
            gmt0sideralTime : 0.0,
            gmtTime : 0.0,
            weekday : 0,
            sun : 0.0,
            moon : 0.0,
            mercury : 0.0,
            venus : 0.0,
            mars : 0.0,
            jupiter : 0.0,
            saturn : 0.0,
            uranus : 0.0,
            neptune : 0.0,
            pluto : 0.0,
            node : 0.0,
            ascendant : 0.0,
            mediumCoeli : 270.0,
			houses : null
			}
        }

        public static function calculateMean(rec1:PlanetPositions, rec2:PlanetPositions, percentAfterRec1:Float):PlanetPositions
        {
            var res = NULLpositions();
            res.ascendant = 0.0; // NullHouses - Houses corresponds to signs
            res.mediumCoeli = 270.0;
            res.gmt0sideralTime = rec1.gmt0sideralTime;

            res.weekday = rec1.weekday;

            if (rec1.sideralTime > rec2.sideralTime)
            {
                var sidTime = calculateMeanFloat(rec1.sideralTime, rec2.sideralTime + 24.0, percentAfterRec1);
                if (sidTime >= 24.0)
                {
                    res.sideralTime = sidTime - 24;
                }
                else
                {
                    res.sideralTime = sidTime;
                }
            }
            else
            {
                res.sideralTime = calculateMeanFloat(rec1.sideralTime, rec2.sideralTime, percentAfterRec1);
            }

            /*if ((rec1.Gmt != 0) || (rec2.Gmt != 0))
            {
                    throw new AstroException("Cannot calculate from records not based on GMT 0:00");
            }*/
            /*res.Day = rec1.Day;
            res.Month = rec1.Month;
            res.Year = rec1.Year;*/


            res.sun = calculateMeanFloat(rec1.sun, rec2.sun, percentAfterRec1);
            res.moon = calculateMeanFloat(rec1.moon, rec2.moon, percentAfterRec1);
            res.mercury = calculateMeanFloat(rec1.mercury, rec2.mercury, percentAfterRec1);
            res.venus = calculateMeanFloat(rec1.venus, rec2.venus, percentAfterRec1);
            res.mars = calculateMeanFloat(rec1.mars, rec2.mars, percentAfterRec1);
            res.jupiter = calculateMeanFloat(rec1.jupiter, rec2.jupiter, percentAfterRec1);
            res.saturn = calculateMeanFloat(rec1.saturn, rec2.saturn, percentAfterRec1);
            res.uranus = calculateMeanFloat(rec1.uranus, rec2.uranus, percentAfterRec1);
            res.neptune = calculateMeanFloat(rec1.neptune, rec2.neptune, percentAfterRec1);
            res.pluto = calculateMeanFloat(rec1.pluto, rec2.pluto, percentAfterRec1);
            res.node = calculateMeanFloat(rec1.node, rec2.node, percentAfterRec1);

            return res;
        }

        
        public static function calcDistance(planetPos1:Float, planetPos2:Float):Float
        {
            var d = -1.0;
            if (planetPos1 > planetPos2)
            {
                d = planetPos1 - planetPos2;
            }
            else
            {
                d = planetPos2 - planetPos1;
            }
            if (d > 180)
            {
                d = 360 - d;
            }
            return d;
        }

        public static function getAspect(pos1:Float, pos2:Float, orbs:Array<Float>):Int
        {
            var dist = calcDistance(pos1, pos2);
            if (dist < 0)
            {
                return -1;
            }
			var i = 0;
            while (i < NUM_ASPECTS)
            {
                /*float asp = ASPECTS[i];
                float orb = orbs[i];
                float lower = asp - orb;
                float upper = asp + orbs;*/
                if (dist >= (ASPECTS[i] - orbs[i]) &&
                    (dist <= (ASPECTS[i] + orbs[i])))
                {
                    return ASPECTS[i];
                }
				i += 1;
            }
            return -1;
        }

        public static function calcGmtSideralTime(year:Int, month:Int, day:Int, hour:Int, minute:Int):Float {
            var gmt2000 = new Date(2000, 0, 1, 12, 0, 0);
            var gmtBirth = new Date(year, month-1, day, hour, minute, 0);
            var secs:Float = (gmtBirth.getTime()/1000) - (gmt2000.getTime()/1000);
            //double secs = gmt2000.secsTo(gmtBirth);
            var days:Float = secs / 86400;
            var GMST:Float = 18.697374558 + 24.06570982441908 * days;

            var ST = GMST;
            if (ST < 0) ST = -ST;
            var twentyFours = Math.floor(ST / 24.0);
            ST = ST - (twentyFours * 24);
            while (ST >= 24) {
                ST -= 24.0;
            }
            if (GMST < 0) {
                ST = -ST;
            }
            //double gmstLong = (double)(GMST * 10000);
            //double hoursTimes10000 = gmstLong % (24 * 10000);
            var gmtSideralTime = ST; //(double)hoursTimes10000 / (double)10000;

            if (gmtSideralTime < 0) {
                gmtSideralTime = 24 + gmtSideralTime;
            }
            return gmtSideralTime;
        }	
		
	public static function emptyPositions() : PlanetPositions {
		return {
			sideralTime : 0.0,
			gmt0sideralTime : 0.0,
			gmtTime : 0.0,
			weekday : 0,
			sun : 0.0,
			moon : 0.0,
			mercury : 0.0,
			venus : 0.0,
			mars : 0.0,
			jupiter : 0.0,
			saturn : 0.0,
			uranus : 0.0,
			neptune : 0.0,
			pluto : 0.0,
			node : 0.0,
			ascendant : 0.0,
			mediumCoeli : 0.0,
			houses : null
		}
	}
	
	public static function duplicate(pp:PlanetPositions) : PlanetPositions 
	{
		var ret = emptyPositions();
		ret.weekday = pp.weekday;
		ret.sideralTime = pp.sideralTime;
		ret.gmt0sideralTime = pp.gmt0sideralTime;
		ret.gmtTime = pp.gmtTime;
		ret.sun = pp.sun;
		ret.moon = pp.moon;
		ret.mercury = pp.mercury;
		ret.venus = pp.venus;
		ret.mars = pp.mars;
		ret.jupiter = pp.jupiter;
		ret.saturn = pp.saturn;
		ret.uranus = pp.uranus;
		ret.neptune = pp.neptune;
		ret.pluto = pp.pluto;
		ret.node = pp.node;
		ret.ascendant = pp.ascendant;
		ret.mediumCoeli = pp.mediumCoeli;
		return ret;
	}	
	
	public static inline function calcPresentablePositions(realPos:PlanetPositions, minDistance:Int) : PlanetPositions {
		return calcPresentablePositionsWithMaxPlanet(realPos, minDistance, AstroDefs.NODE);
	}
	public static inline function calcPresentablePositionsWithAscMc(realPos:PlanetPositions, minDistance:Int) : PlanetPositions {
		return calcPresentablePositionsWithMaxPlanet(realPos, minDistance, AstroDefs.MEDIUM_COELI);
	}	
	public static function calcPresentablePositionsWithMaxPlanet(realPos:PlanetPositions, minDistance:Int, maxPlanet:Int) : PlanetPositions
	{
		var ret = AstroDefs.duplicate(realPos);

		var pos1:Float;
		var pos2:Float;
		var dist:Float;
		var allOk = false;
		var cnt = 0;
		var maxCnt = 10;
		// TODO: Figure out better algorithm ?
		while (!allOk) {
			allOk = true;
			for (p1 in AstroDefs.SUN...maxPlanet+1) //  AstroDefs.NODE+1)
			{
				pos1 = AstroDefs.positionOfPlanet(ret, p1);
				for (p2 in AstroDefs.SUN...maxPlanet+1) //  AstroDefs.NODE+1)
				{
					if (p1 == p2) {
						continue;
					}
					pos2 = AstroDefs.positionOfPlanet(ret, p2);
					dist = AstroDefs.calcDistance(pos1, pos2);
					if (dist < minDistance) {
						allOk = false;
						var delta = minDistance - dist;
						var p1attempt = AstroDefs.filter360(pos1 - delta / 2 - 0.1);
						var p2attempt = AstroDefs.filter360(pos2 + delta / 2 + 0.1);
						if (!(AstroDefs.calcDistance(p1attempt, p2attempt) >= minDistance))
						{
							p1attempt = AstroDefs.filter360(pos1 + delta / 2 + 0.1);
							p2attempt = AstroDefs.filter360(pos2 - delta / 2 - 0.1);
						}
						AstroDefs.setPosition(ret, p1, p1attempt);
						AstroDefs.setPosition(ret, p2, p2attempt);
					}
				}

			}
			cnt++;
			if (cnt >= maxCnt) {
				break;
			}
		}
		//qDebug("presentationAttemts=%d", cnt);
		//qDebug("calcPresentablePositions DONE");
		return ret;
	}	
	
	public static var ELEMENT_COLORS = [0xFF4040, 0xFFFF40, 0x40FF40, 0x4040FF];
	
	public static function colorForAspect(aspect:Int) {
		//byte n = 64;
		//byte alpha = 255;
		switch (aspect) {
			case 0: return 0x4040FF; // Color.FromArgb(alpha, n, n, 255); //=> 0x0000FFFF, #[0,0,255],
			case 30: return 0x4040FF; // Color.FromArgb(alpha, n, n, 255); // => 0x0000FFFF, #[0,0,255],
			case 45: return 0xFF4040; // Color.FromArgb(alpha, 255, n, n); // => 0xFF0000FF, #[255,0,0],
			case 60: return 0x4040FF; // Color.FromArgb(alpha, n, n, 255); // => 0x0000FFFF, #[0,0,255],
			case 72: return 0x404040; // Color.FromArgb(alpha, n, n, n); // => 0x000000FF, #[0,0,0],
			case 90: return 0xFF4040; // Color.FromArgb(alpha, 255, n, n); // => 0xFF0000FF, #[255,0,0],
			case 120: return 0x4040FF; // Color.FromArgb(alpha, n, n, 255); // => 0x0000FFFF, #[0,0,255],
			case 135: return 0x40FF40; // Color.FromArgb(alpha, n, 255, n); // => 0x00FF00FF, #[0,255,0],
			case 150: return 0x40FF40; // Color.FromArgb(alpha, n, 255, n); //=> 0x00FF00FF, #[0,255,0],
			case 180: return 0xFF4040; // Color.FromArgb(alpha, 255, n, n); // => 0xFF0000FF #[255,0,0]
			default: return 0x404040; // Color.FromArgb(alpha, n, n, n); ;
		}
	}
	
	public static function houseOfPosition(pos:Float, Houses:Array<Float>) : Int
	{
		for (i in HOUSE_1...HOUSE_12+1)
		{
			var cur = Houses[i];
			var next = (i == HOUSE_12 ? Houses[HOUSE_1] : Houses[i + 1]);
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
	
	public static function coordinatesToString(latitude:Float, longitude:Float) : String
	{
		return coordinateCentsToString(Math.floor(latitude * 100), Math.floor(longitude * 100));
	}
	
	
	public static function coordinateCentsToString(latitudeCents:Int, longitudeCents:Int) : String
	{
		var latS = "N";
		if (latitudeCents < 0)
		{
			latS = "S";
			latitudeCents = -latitudeCents;
		}
		var longS = "E";
		if (longitudeCents < 0)
		{
			longS = "W";
			longitudeCents = -longitudeCents;
		}

		var latFull = Math.floor(latitudeCents / 100);
		var longFull = Math.floor(longitudeCents / 100);
		var latCent = Math.floor(latitudeCents - (100 * latFull));
		var longCent = Math.floor(longitudeCents - (100 * longFull));

		return Std.string(latFull) + latS + (latCent < 10 ? "0" : "") + Std.string(latCent) +
				" " +
				Std.string(longFull) + longS + (longCent < 10 ? "0" : "") + Std.string(longCent);
	}	
	
	public function new() 
	{
		//var bytes:ByteArray = Assets.getBytes("assets/ef2/1978.ef2");
		//bytes.
	}
	
}