package com.leapinglight.astrology.gui.openfl ;

//import openfl.utils.SystemPath;
import sys.FileSystem;
import sys.io.File;
import sys.io.FileInput;
import sys.io.FileOutput;
import flash.net.URLLoader;
import flash.net.URLRequest;

/**
 * ...
 * @author Roy
 */
class Loader {
	var cnt = 0;
	var total = 0;
	var allLoaded : Int -> Void;
	var countFunc : { count : Int, total : Int } -> Void;
	var toLoad:Array<String>;
	var error:Dynamic->Void;
	public function new(countFunc, allLoaded, error) {
		this.countFunc = countFunc;
		this.allLoaded = allLoaded;
		this.error = error;
	}
	public function listLoaded(complete:String) {
		var files:Array<String> = complete.split("\n");
		var have:Array<String> = ChartFileUtil.getVipFiles();
		toLoad = new Array<String>();
		for (f in files) {
			trace(f);
			f = StringTools.trim(f);
			if (!contains(have, f)) {
				trace("pushing");
				if (f.length > 0) {
					toLoad.push(f);
				}
			}
		}
		total = toLoad.length;
		if (total == 0) {
			allLoaded(total);
			return;
		}
		ChartFileUtil.loadRemoteVipFile(StringTools.trim(toLoad[cnt]), loader, error);
	}
	function loader(data:String) {
		//trace("LOADED: " + data);
		trace("LOADEDDD");
		trace(cnt);
		trace(toLoad);
		if (cnt >= total) {
			allLoaded(total);
		}
		var fname = StringTools.trim(toLoad[cnt]);
		trace("ADDING");
		cnt++;
		trace("saving: " + fname);
		
		ChartFileUtil.saveVip(fname, data);
		ChartFileUtil.loadRemoteVipFile(StringTools.trim(StringTools.trim(toLoad[cnt])), loader, error);
	}	
	static function contains(a:Array<String>, s:String) : Bool {
		for (i in a) {
			if (i == s) {
				return true;
			}
		}
		return false;
	}	
}
 
class ChartFileUtil
{
	public static function loadRemoteVipList(complete : String -> Void, error : Dynamic -> Void) {
		return loadRemoteVipFile("index.txt", complete, error);
	}
	public static function loadRemoteVipFile(fname:String, complete : String -> Void, error : Dynamic -> Void) {
		trace("WILL LOAD: " + "http://www.leapinglight.com/astro/vip/" + fname);
		return loadRemote("http://www.leapinglight.com/astro/vip/" + fname, complete, error);
	}

	public static function loadVipsNotLoaded(countFunc, allLoaded, error) {
		//var have:Array<String> = getVipFiles();
		var cnt = 0;
		var total = 0;
		loadRemoteVipList(new Loader(countFunc,allLoaded,error).listLoaded, error);
	}
	public static function saveVip(fname:String, data:String) {
		saveFile(vipDir(), fname, data);
	}
	public static function saveChart(fname:String, data:String) {
		saveFile(chartsDir(), fname, data);
	}
	public static function getVipFiles() : Array<String> {
		return readDir(vipDir());
	}
	public static function getChartFiles() : Array<String> {
		return readDir(chartsDir());
	}
	public static function deleteVip(fname:String) {
		return deleteFile(vipDir(), fname);
	}
	public static function deleteChart(fname:String) {
		return deleteFile(chartsDir(), fname);
	}

	////

	static function loadRemote(url:String, complete : String -> Void, error : Dynamic -> Void) {
		var u:URLRequest = new URLRequest(url);
		var l = new URLLoader();
		var f = function(d:Dynamic) : Void {
			complete(l.data);
		}
		l.addEventListener("complete", f);
		l.addEventListener("ioError", error);
		l.load(u);		
	}
	
	
	
	static inline function rootDir() {
		//return SystemPath.documentsDirectory;
		return SystemPath.applicationStorageDirectory;
	}
	
	static function readDir(dir:String) : Array<String> {
		trace("reading " + dir);
		createIfNotExists(dir);
		return FileSystem.readDirectory(dir);
	}
	static inline function vipDir() :String {
		return rootDir() + "/vip";
	}
	static inline function chartsDir() :String {
		return rootDir() + "/charts";
	}
	
	static inline function hasVipDir() : Bool {
		return FileSystem.exists(vipDir());
	}
	static inline function hasChartsDir() : Bool {
		return FileSystem.exists(chartsDir());
	}
	static inline function createIfNotExists(dir:String) {
		if (!FileSystem.exists(dir)) {
			FileSystem.createDirectory(dir);
		}		
	}
	public static function readVip(fname:String) {
		return readFile(vipDir(), fname);
	}
	
	static function readFile(dir:String, fname:String) {
		var f:FileInput = File.read(dir + "/" + fname, false);
		var s = "";
		var c = 0;
		try {
		while (true) {
			c++;
			//trace(c);
			s += f.readLine() + "\n";
			//trace(s);
		}
		} catch( ex:haxe.io.Eof ) 
    {}
		//trace("returning");
		return s;
	}
	static function saveFile(dir:String, fname:String, data:String) {
		createIfNotExists(dir);
		var f:FileOutput = File.write(dir + "/" + fname, false);
		f.writeString(data);
		f.close();
	}
	static function deleteFile(dir:String, fname:String) {
		FileSystem.deleteFile(dir + "/" + fname);
	}
	
	
	
	public function new() 
	{
		//Sys.
		//File.write(SystemPath.applicationStorageDirectory + path + fileName, true);
		//documents
		
	}
	
}
