package;

import PlaneSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var plane:PlaneSprite;
	var bg:FlxSprite;
	override public function create()
	{
		bg = new FlxSprite(AssetPaths.background__jpg);
		bg.setPosition(0,0);
		bg.scale.x = FlxG.width / bg.width;
		bg.scale.x = FlxG.height / bg.height;
		bg.updateHitbox();
		add(bg);
		plane = new PlaneSprite(220, 220);
		add(plane);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
