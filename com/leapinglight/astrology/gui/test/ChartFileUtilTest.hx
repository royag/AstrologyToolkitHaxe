package com.leapinglight.astrology.gui.test;

import com.leapinglight.astrology.gui.openfl.ChartFileUtil;
import flash.net.URLLoader;
import flash.net.URLRequest;
import haxe.unit.TestCase;
/**
 * ...
 * @author Roy
 */
class ChartFileUtilTest extends TestCase
{
	var l:URLLoader;
	public function test1() {
		//trace(ChartFileUtil.getVipFiles());
		//ChartFileUtil.loadRemoteVipList(loaded, err);
		assertTrue(true);
		
	}
	var isLoaded = false;
	function err(d:Dynamic) {
		trace("err" + Std.string(d));
	}
	
	function loaded(d:Dynamic) {
		trace("loaded");
		//trace(l.data);
		trace(d);
		//l.spl
		isLoaded = true;
	}
}