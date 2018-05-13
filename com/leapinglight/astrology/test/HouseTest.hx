package com.leapinglight.astrology.test;
import com.leapinglight.astrology.AstroDefs;
import com.leapinglight.astrology.AstroDefs.PlanetPositions;
import haxe.unit.TestCase;

import com.leapinglight.astrology.HouseCalc;

/**
 * ...
 * @author Roy
 */
class HouseTest extends TestCase
{
	static function rec1() {
		var rec:PlanetPositions = AstroDefs.emptyPositions();
		rec.gmt0sideralTime = 13.32277;
		rec.gmtTime = 18.33333;
		rec.sideralTime = 13.373067;
		return rec;
	}
	static function rec1withAscMc() {
		var rec = rec1();
		rec.ascendant = 202.30493;
		rec.mediumCoeli = 123.4958;
		return rec;
	}
	static inline var LAT_Drammen = 59.74;
	static inline var LONG_Drammen = 10.21;

	public function testAscMc1() {
		var rec = rec1();
		HouseCalc.calcAscAndMc(rec, LAT_Drammen, LONG_Drammen);
		assertEquals(202, Math.round(rec.ascendant));
		assertEquals(123, Math.floor(rec.mediumCoeli));
	}
	
	public function testLocalSideral1() {
		var rec = rec1();
		var localSideral = HouseCalc.calculateLocalSideral(rec.gmt0sideralTime, AstroDefs.hmsToHours(18, 20, 0), LONG_Drammen);
		assertEquals(8387, Math.round(localSideral * 1000));
	}
	
	public function testPlacidus1() {
		var rec = rec1withAscMc();
		var houses = HouseCalc.emptyHouseArray();
		var localSideral = 8.386982328;
		HouseCalc.calcHousesPlacidus(houses, rec.ascendant, rec.mediumCoeli, localSideral, LAT_Drammen);
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
	}
	
	public function testKoch1() {
		var rec = rec1withAscMc();
		var houses = HouseCalc.emptyHouseArray();
		var localSideral = 8.386982328;
		HouseCalc.calcHousesKoch(houses, rec.ascendant, rec.mediumCoeli, localSideral, LAT_Drammen);
		assertEquals(202, Math.floor(houses[0]));
		assertEquals(228, Math.floor(houses[1]));
		assertEquals(256, Math.round(houses[2]));
		assertEquals(303, Math.floor(houses[3]));
		assertEquals(330, Math.round(houses[4]));
		assertEquals(356, Math.round(houses[5]));
		
		assertEquals(22, Math.floor(houses[6]));
		assertEquals(48, Math.floor(houses[7]));
		assertEquals(76, Math.round(houses[8]));
		assertEquals(123, Math.floor(houses[9]));
		assertEquals(150, Math.round(houses[10]));
		assertEquals(176, Math.round(houses[11]));		
	}
	
	public function testPorphyry1() {
		var rec = rec1withAscMc();
		var houses = HouseCalc.emptyHouseArray();
		HouseCalc.calcHousesPorphyry(houses, rec.ascendant, rec.mediumCoeli);
		assertEquals(202, Math.floor(houses[0]));
		assertEquals(236, Math.round(houses[1]));
		assertEquals(270, Math.round(houses[2]));
		assertEquals(303, Math.floor(houses[3]));
		assertEquals(330, Math.round(houses[4]));
		assertEquals(356, Math.round(houses[5]));
		
		assertEquals(22, Math.floor(houses[6]));
		assertEquals(56, Math.round(houses[7]));
		assertEquals(90, Math.round(houses[8]));
		assertEquals(123, Math.floor(houses[9]));
		assertEquals(150, Math.round(houses[10]));
		assertEquals(176, Math.round(houses[11]));		
	}		
	
	
}