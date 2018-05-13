package com.leapinglight.geo;

import com.leapinglight.io.Assets;
import com.leapinglight.io.ByteArray;
import com.leapinglight.io.Endian;

/**
 * ...
 * @author roy
 */

typedef GeoCountryInfo = {
	countryCode:String,
	countryName:String
}
 

typedef GeoPlaceInfo = {
	placeName:String,
	latitudeCents:Int,
	longitudeCents:Int
}

class GeoData 
{
	public function new() 
	{
		
	}

	public static function loadCountryInfo() : Array<GeoCountryInfo>
	{
		var dummy = new Array<GeoPlaceInfo>();
		var ret = new Array<GeoCountryInfo>();
		load(true, ret, dummy);
		return ret;
	}

	public static function loadPlaceInfoForCountryCode(code:String) : Array<GeoPlaceInfo>
	{
		var ret = new Array<GeoPlaceInfo>();
		var dummy = new Array<GeoCountryInfo>();
		load(false, dummy, ret, true, code);
		return ret;
	}

	public static function readStringOfSize(r:ByteArray, size:Int):String
	{
		/*string ret = "";
		for (int i = 0; i < size; i++)
		{
			char c = (char)r.ReadByte();
			ret += c;
		}
		return ret;*/
		return r.readUTFBytes(size);
	}
/*
	public static string coordinatesToString(float latitude, float longitude)
	{
		return coordinatesToString((int)(latitude * 100.0f), (int)(longitude * 100.0f));
	}

	public static string coordinatesToString(int latitudeCents, int longitudeCents)
	{
		string latS = "N";
		if (latitudeCents < 0)
		{
			latS = "S";
			latitudeCents = -latitudeCents;
		}
		string longS = "E";
		if (longitudeCents < 0)
		{
			longS = "W";
			longitudeCents = -longitudeCents;
		}

		int latFull = latitudeCents / 100;
		int longFull = longitudeCents / 100;
		int latCent = latitudeCents - (100 * latFull);
		int longCent = longitudeCents - (100 * longFull);

		return latFull.ToString() + latS + (latCent < 10 ? "0" : "") + latCent.ToString() +
				" " +
				longFull.ToString() + longS + (longCent < 10 ? "0" : "") + longCent.ToString();
	}
	*/

	private static var GEODATA:ByteArray = null;
	
	private static function load(loadCountries:Bool,
		countryTarget:Array<GeoCountryInfo>,
		placeTarget:Array<GeoPlaceInfo>,
		loadPlaces:Bool = false,
		wantedCountryCode:String = "tst") : Void
	{
		if (GEODATA == null) {
			GEODATA = Assets.getBytes("assets/geodata/geodata.dat");
			GEODATA.endian = Endian.LITTLE_ENDIAN;
		}
		var reader:ByteArray = GEODATA;
		reader.position = 0;
		
		//reader.
		var countryCodeSize:Int; // Byte
		var countryCode:String;
		var countryNameSize:Int; // Byte
		var countryName:String;
		var countryDataSize: Int; //UInt16

		var placeNameSize:Int; // byte
		var placeName:String;
		var latitude:Int; // Int16
		var longitude:Int; // Int16

		while (reader.bytesAvailable > 0)
		{
			countryCodeSize = reader.readUnsignedByte();
			countryCode = readStringOfSize(reader, countryCodeSize);
			countryNameSize = reader.readUnsignedByte();
			countryName = readStringOfSize(reader, countryNameSize);
			countryDataSize = reader.readUnsignedShort(); // .ReadUInt16();

			if (loadCountries)
			{
				var gci:GeoCountryInfo = {
					countryCode : countryCode,
					countryName : countryName
				}
				countryTarget.push(gci);
			}


			if (loadPlaces && (wantedCountryCode.toUpperCase() == countryCode.toUpperCase()))
			{
				var bytesRead = 0;
				while (bytesRead < countryDataSize)
				{
					placeNameSize = reader.readUnsignedByte();
					placeName = readStringOfSize(reader, placeNameSize);
					latitude = reader.readShort();
					longitude = reader.readShort();

					bytesRead += 1 + placeNameSize + 2 + 2;

					var gpi:GeoPlaceInfo = {
					placeName : placeName,
					latitudeCents : latitude,
					longitudeCents : longitude
					}
					placeTarget.push(gpi);
				}
				if (!loadCountries)
				{
					break; // while
				}
			}
			else
			{
				//reader.BaseStream.Seek(countryDataSize, SeekOrigin.Current);
				reader.position += countryDataSize;
				//in.skipRawData(countryDataSize);
			}
		}
	}	
}