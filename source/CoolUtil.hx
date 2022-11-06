package;

import flixel.FlxG;
import openfl.utils.Assets;

using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<Dynamic> = [['Easy', '-easy'], ['Normal', ''], ['Hard', '-hard']];

	public static function difficultyString(curDifficulty:Int):String
		return difficultyArray[curDifficulty][0];

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = [];

		if (Assets.exists(path))
			daList = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
			daList[i] = daList[i].trim();

		return daList;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];

		for (i in min...max)
			dumbArray.push(i);

		return dumbArray;
	}

	public static function camLerpShit(ratio:Float):Float
		return FlxG.elapsed / (1 / 60) * ratio;

	public static function coolLerp(a:Float, b:Float, ratio:Float):Float
		return a + camLerpShit(ratio) * (b - a);

	public static function boundTo(value:Float, min:Float, max:Float):Float
	{
		var newValue:Float = value;

		if (newValue < min)
			newValue = min;
		else if (newValue > max)
			newValue = max;

		return newValue;
	}

	public static function getInterval(size:Float):String
	{
		var data:Int = 0;

		final intervalArray:Array<String> = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
		while (size > 1024 && data < intervalArray.length - 1)
		{
			data++;
			size = size / 1024;
		}

		size = Math.round(size * 100) / 100;
		return size + ' ' + intervalArray[data];
	}

	public static function truncateFloat(number:Float, precision:Int):Float
	{
		number = number * Math.pow(10, precision);
		number = Math.round(number) / Math.pow(10, precision);
		return number;
	}
}
