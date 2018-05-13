package com.leapinglight.astrology.test;
import com.leapinglight.geo.test.GeoTest;
import haxe.unit.TestRunner;
import com.leapinglight.time.test.TzTest;
import com.leapinglight.time.test.UTCTest;
#if openfl
//import com.leapinglight.astrology.gui.test.ChartFileUtilTest;
#end

/**
 * ...
 * @author ...
 */
class AllAstroTests
{
	public function new() { }
	
	public function runTests() : String {
        var r = new TestRunner();
		
        r.add(new TzTest());
		r.add(new UTCTest());
		r.add(new GeoTest());
		r.add(new EphemTest());
		r.add(new HouseTest());
		r.add(new ChartTest());
		r.add(new ChartBigTest());
		r.add(new DefaultZoneTest());
		#if openfl
		//r.add(new ChartFileUtilTest());
		#end
        // your can add others TestCase here

        // finally, run the tests
		var start = Date.now().getTime();
        r.run();
		var end = Date.now().getTime();
		var time = end - start;
		trace("Test-time: " + Std.string(time));
		return r.result.toString();
	}
	
}