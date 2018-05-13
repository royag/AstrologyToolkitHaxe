package com.leapinglight.astrology.gui.openfl ;
import openfl.display.DisplayObject;

class DisplayObjectWrapper implements IImage
{

	var obj:DisplayObject;
	public function new(o:DisplayObject) {
		this.obj = o;
	}
	public var x(get, set) : Float;
	public var y(get, set) : Float;
	public var width(get, null) : Float;
	public var height(get, null) : Float;
	public var visible(get, set) : Bool;
	
	function get_x() { return obj.x; }
	function set_x(n:Float) { obj.x = n; return obj.x; }
	function get_y() { return obj.y; }
	function set_y(n:Float) { obj.y = n; return obj.y;  }
	function get_width() { return obj.width; }
	function get_height() { return obj.height; }
	function get_visible() { return obj.visible; }
	function set_visible(n:Bool) { obj.visible = n; return obj.visible; }
	  
}