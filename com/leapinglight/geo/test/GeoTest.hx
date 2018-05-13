package com.leapinglight.geo.test;
import haxe.unit.TestCase;

/**
 * ...
 * @author Roy
 */
class GeoTest extends TestCase
{

	public function testDrammen() {
		var p = GeoData.loadPlaceInfoForCountryCode("NO");
		var found = false;
		for (place in p) {
			if (place.placeName == "Drammen") {
				found = true;
				assertEquals(5974, place.latitudeCents);
				assertEquals(1021, place.longitudeCents);
			}
		}
		assertTrue(found);
	}
	
	public function testIso() {
		assertEquals("USDC", GeoIsoUtil.countryCodeForIsoCode("US"));
		assertEquals("USPR", GeoIsoUtil.countryCodeForIsoCode("PR"));
		assertEquals("RS", GeoIsoUtil.countryCodeForIsoCode("RU"));
		assertEquals("NO", GeoIsoUtil.countryCodeForIsoCode("NO"));
	}
	
	public function testPlaceDefaults() {
		var countries = GeoData.loadCountryInfo();
		for (c in countries) {
			var defaultPlace = PlaceDefaults.defaultPlaceForCountryCode(c.countryCode);
			if (defaultPlace != null) {
				var places = GeoData.loadPlaceInfoForCountryCode(c.countryCode);
				var foundPlace = false;
				for (p in places) {
					if (p.placeName == defaultPlace) {
						foundPlace = true;
						break;
					}
				}
				if (!foundPlace) {
					//assertEquals("xxx", defaultPlace);
					assertEquals(places[0].placeName, defaultPlace);
				}
			}
		}
		assertTrue(true);
	}
	
	public function testWashingtonLatLong() {
		doTestLatLong("USDC", "Washington", 3889, -7703);
	}
	
	public function testBuenosAiresLatLong() {
		doTestLatLong("AR", "Buenos Aires", -3458, -5867);
	}
	
	public function testSydneyLatLong() {
		doTestLatLong("AS", "Sydney", -3388, 15121);
	}	
	
	public function testOsloLatLong() {
		doTestLatLong("NO", "Oslo", 5991, 1075);
	}	
	
	//"NO","Oslo","5991","1075"
	
	public function doTestLatLong(cc:String,pl:String,expLat:Int,expLong:Int) {
		/*var cc = "USDC";
		var pl = "Washington";
		var expLat = 3889;
		var expLong = -7703;*/
		var places = GeoData.loadPlaceInfoForCountryCode(cc);
		for (p in places) {
			if (p.placeName == pl) {
				assertEquals(expLat, p.latitudeCents);
				assertEquals(expLong, p.longitudeCents);
			}
		}
	}
	
}