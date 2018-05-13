package com.leapinglight.astrology.gui;

/**
 * @author Roy
 */

interface IImage 
{
	public var x(get, set) : Float;
	public var y(get, set) : Float;
	public var width(get, null) : Float;
	public var height(get, null) : Float;
	public var visible(get, set) : Bool;
}