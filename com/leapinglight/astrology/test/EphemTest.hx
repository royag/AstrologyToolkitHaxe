package com.leapinglight.astrology.test;
import haxe.unit.TestCase;

/**
 * ...
 * @author Roy
 */
class EphemTest extends TestCase
{

	public function test1978April12() {
		var rec = AstroLoader.calculateRecForGmt(1978, 4, 12, 18, 20, 0, null);
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
	
}