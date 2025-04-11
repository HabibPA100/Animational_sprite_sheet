package;

import EnemyPlane;
import PlaneSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var plane:PlaneSprite;
	var backgrounds:Array<FlxSprite> = [];
	var scrollSpeed:Float = 1;
	var score:Int = 0;
	var scoreText:FlxText;

	override public function create()
	{
		super.create();
		// Bg music
		FlxG.sound.playMusic(AssetPaths.bg_music__mp3, 0.5, true); // volume 1.0, loop = true

		// ৩টা ব্যাকগ্রাউন্ড তৈরি করো
		var bg1 = new FlxSprite(0, 0, AssetPaths.backgroundOne__jpg);
		var bg2 = new FlxSprite(0, -FlxG.height, AssetPaths.backgroundTwo__jpg);
		var bg3 = new FlxSprite(0, -FlxG.height * 2, AssetPaths.backgroundThree__jpg);

		for (bg in [bg1, bg2, bg3])
		{
			bg.scale.set(FlxG.width / bg.width, FlxG.height / bg.height);
			bg.updateHitbox();
			add(bg);
			backgrounds.push(bg);
		}

		// প্লেন
		plane = new PlaneSprite(220, 220);
		plane.scoreRef = function()
		{
			score++;
			scoreText.text = "Score: " + score;
		}
		add(plane);
		// Score
		scoreText = new flixel.text.FlxText(10, 10, 200, "Score: 0");
		add(scoreText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		for (bg in backgrounds)
		{
			bg.y += scrollSpeed;

			// যদি ব্যাকগ্রাউন্ড স্ক্রিনের নিচে পুরোপুরি চলে যায়,
			// তাহলে সেটিকে আবার উপরে পাঠিয়ে দাও
			if (bg.y >= FlxG.height)
			{
				// সব ব্যাকগ্রাউন্ডের মধ্যে সবচেয়ে উপরেরটার y বের করো
				var minY = backgrounds[0].y;
				for (b in backgrounds)
				{
					if (b.y < minY)
						minY = b.y;
				}
				bg.y = minY - FlxG.height;
			}
		}
	}
}
