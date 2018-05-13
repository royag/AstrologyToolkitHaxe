package com.leapinglight.astrology.test;
import com.leapinglight.geo.TimeZoneDefaults;
import haxe.unit.TestCase;

/**
 * ...
 * @author Roy
 */
class DefaultZoneTest extends TestCase
{

	public function testNorway() {
		assertCodeZone("NO", "Europe/Oslo");
	}

	public function testNewYork() {
		assertCodeZone("USNY", "America/New_York");
	}
	
	
	function assertCodeZone(cc:String, zone:String) {
		assertEquals(zone, TimeZoneDefaults.getDefaultZonesForCountryCode(cc)[0]);
	}
}