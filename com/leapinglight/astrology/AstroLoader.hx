package com.leapinglight.astrology ;
import com.leapinglight.astrology.AstroDefs;

import com.leapinglight.io.Assets;
import com.leapinglight.io.ByteArray;
import com.leapinglight.io.Endian;

class AstroLoader
{

	public function new() 
	{
		
	}
	
public static function readDayFromBytes(s:ByteArray) : EPHEM_REC {
		var ret = { 
			dummy  : 0,
			weekday : 0,
			sid_h :  0,
			sid_m : 0,
			sid_s : 0,
			gmt : 0,
			day : 0,
			month : 0,
			year : 0,
			sun : 0,
			moon : 0,
			mercury : 0,
			venus : 0,
			mars : 0,
			jupiter : 0,
			saturn : 0,
			uranus : 0,
			neptune : 0,
			pluto : 0,
			node : 0,
		};
	
		ret.dummy = s.readUnsignedShort();
		ret.weekday = s.readUnsignedShort();
		ret.sid_h = s.readUnsignedShort();
		ret.sid_m = s.readUnsignedShort();
		ret.sid_s = s.readUnsignedShort();
		ret.gmt = s.readUnsignedShort();
		ret.day = s.readUnsignedShort();
		ret.month = s.readUnsignedShort();
		ret.year = s.readUnsignedInt();
		ret.sun = s.readUnsignedShort();
		ret.moon = s.readUnsignedShort();
		ret.mercury = s.readUnsignedShort();
		ret.venus = s.readUnsignedShort();
		ret.mars = s.readUnsignedShort();
		ret.jupiter = s.readUnsignedShort();
		ret.saturn = s.readUnsignedShort();
		ret.uranus = s.readUnsignedShort();
		ret.neptune = s.readUnsignedShort();
		ret.pluto = s.readUnsignedShort();
		ret.node = s.readUnsignedShort();
		
		return ret;
	}
	
	public static function readYearFromBytes(s:ByteArray) : Array < EPHEM_REC > {
		var ret = new Array<EPHEM_REC>();
		var i = 0;
		while (i < 366) {
			ret.push(readDayFromBytes(s));
			i++;
		}
		return ret;
	}
	
	public static function readYear(year:Int) : Array < EPHEM_REC > {
		var s = Assets.getBytes("assets/ef2/" + Std.string(year) + ".ef2");
		s.endian  = Endian.LITTLE_ENDIAN;
		return readYearFromBytes(s);
	}
	
public static function _calculateRecForGmt(year:Int, dayNo:Int, gmtHour:Float, preLoadedYear:EphemYearHolder,
                                                  verifyMonth:Int = 0, verifyDay:Int = 0):PlanetPositions
        {
            var y1:EPHEM_YEAR;
            var rec1:EPHEM_REC;
            var rec2:EPHEM_REC;
            if (preLoadedYear != null && preLoadedYear.year != null && preLoadedYear.year[0].year == year)
            {
                y1 = preLoadedYear.year;
            }
            else
            {
                y1 = readYear(year);
				if (preLoadedYear != null) {
					preLoadedYear.year = y1;
				}
            }
            if (dayNo == 365)
            {
                var y2:EPHEM_YEAR;
                y2 = readYear(year + 1);
                rec1 = y1[365];
                rec2 = y2[0];
            }
            else
            {
                rec1 = y1[dayNo];
                rec2 = y1[dayNo + 1];
            }
            if (verifyMonth != 0 && rec1.month != verifyMonth)
            {
                return AstroDefs.NULLpositions();
            }
            if (verifyDay != 0 && rec1.day != verifyDay)
            {
                return AstroDefs.NULLpositions();
            }
            var ret = AstroDefs.calculateMean(AstroDefs.positionsForEphemRec(rec1), AstroDefs.positionsForEphemRec(rec2), (gmtHour * 100) / 24);
            ret.gmtTime = gmtHour;
            return ret;
        }

        public static function calculateRecForGmt(year, month, day, h, m, s, preLoadedYear):PlanetPositions
        {
            return _calculateRecForGmt(year,
                                            AstroDefs.dayNoFromMonthDay(month, day),
                                            AstroDefs.hmsToHours(h, m, s), preLoadedYear, month, day);
        }

	
}