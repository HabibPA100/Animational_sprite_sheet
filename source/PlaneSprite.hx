package;

import Bullet;
import EnemyPlane;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlaneSprite extends FlxSprite
{
	public var bullets:FlxGroup;
	var enemies:FlxGroup;
	public var scoreRef:()->Void;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		// প্লেন ইমেজ লোড
		loadGraphic("assets/images/plane_anim.png", true, 200, 200); // true মানে এটা animated
		animation.add("fly", [0, 1, 2, 3, 4, 5, 6, 7], 10, true);
		animation.play("fly");
		origin.set(width / 2, height / 2);
		scale.set(0.5, 0.5);
		updateHitbox();
		this.x = (FlxG.width / 2) - (width / 2);
		this.y = (FlxG.height / 2) - (height / 2);

		// গুলির গ্রুপ
		bullets = new FlxGroup();
		FlxG.state.add(bullets);

		// শত্রুদের গ্রুপ
		enemies = new FlxGroup();
		FlxG.state.add(enemies);

		for (i in 0...5)
		{
			var enemy = new EnemyPlane(FlxG.random.float(0, FlxG.width - 100), -FlxG.random.float(0, 300));
			enemies.add(enemy);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// নিয়ন্ত্রণ
		if (FlxG.keys.pressed.LEFT)
		{
			if (angle > -45) angle -= 1;
		}
		else if (angle < 0)
		{
			angle += 1;
			if (angle > 0) angle = 0;
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			if (angle < 45) angle += 1;
		}
		else if (angle > 0)
		{
			angle -= 1;
			if (angle < 0) angle = 0;
		}

		if (FlxG.keys.pressed.A) this.x -= 10;
		if (FlxG.keys.pressed.D) this.x += 10;
		if (FlxG.keys.pressed.UP) velocity.y = -100;
		else if (FlxG.keys.pressed.DOWN) velocity.y = 100;
		else velocity.y = 0;

		if (FlxG.keys.justPressed.SPACE)
		{
			this.x = (FlxG.width / 2) - width / 2;
			this.y = (FlxG.height / 2) - height / 2;
		}

		if (FlxG.keys.pressed.LEFT && FlxG.keys.pressed.UP) this.x -= 5;
		else if (FlxG.keys.pressed.RIGHT && FlxG.keys.pressed.UP) this.x += 5;
		else velocity.x = 0;

		// গুলি চালানো
		if (FlxG.keys.pressed.G)
		{
			var rad = (angle - 90) * Math.PI / 180;
			var offset = 50;
			var midpoint = getMidpoint();
			var centerX = midpoint.x;
			var centerY = midpoint.y;

			var bullet1 = new Bullet(centerX + Math.cos(rad) * offset, centerY + Math.sin(rad) * offset, angle);
			var bullet2X = centerX - Math.sin(rad) * 15 + Math.cos(rad) * offset;
			var bullet2Y = centerY + Math.cos(rad) * 15 + Math.sin(rad) * offset;
			var bullet2 = new Bullet(bullet2X, bullet2Y, angle);
			var bullet3X = centerX + Math.sin(rad) * 15 + Math.cos(rad) * offset;
			var bullet3Y = centerY - Math.cos(rad) * 15 + Math.sin(rad) * offset;
			var bullet3 = new Bullet(bullet3X, bullet3Y, angle);

			bullets.add(bullet1);
			bullets.add(bullet2);
			bullets.add(bullet3);
		}

		FlxG.overlap(this, enemies, function(plane:FlxObject, enemy:FlxObject)
		{
			// একবারই চালানোর জন্য ফ্ল্যাগ ব্যবহার করো

			// Plane, Enemy ধ্বংস
			plane.kill();
			enemy.kill();

			// Explosion sound
			FlxG.sound.music.pause();
			FlxG.sound.play(AssetPaths.mainPlaneDestroy__mp3);

			// Explosion animation দেখানো (চাইলে particle effect)
			var boom = new FlxSprite(plane.x, plane.y);
			boom.loadGraphic("assets/images/mainPlaneDestroy.png", true, 200, 100);
			boom.animation.add("explode", [
				1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
			], 10, false);
			boom.animation.play("explode");
			boom.origin.set(boom.width / 2, boom.height / 2);
			boom.scale.set(0.5, 0.5);
			boom.updateHitbox();
			FlxG.state.add(boom);

			// একটু সময় দিয়ে তারপর গেম ওভার স্ক্রিন দেখাও
			FlxG.camera.fade(0xff000000, 2, false, function()
			{
				FlxG.switchState(new GameOverState());
			});
		});
			

		// শত্রু ধ্বংস ও বিস্ফোরণ
		FlxG.overlap(bullets, enemies, function(bullet:FlxObject, enemy:FlxObject)
		{
			trace("Enemy hit!");
			bullet.kill();
			var ex = enemy.x;
            var ey = enemy.y;
			enemy.kill();
			FlxG.sound.play(AssetPaths.boomb__wav, 1, false, null, true);

			ScoreManager.add(1); 
			if (scoreRef != null) scoreRef(); // স্কোর বাড়াও

			var bust = new FlxSprite(ex, ey);
			bust.loadGraphic("assets/images/bust.png", true, 100, 50);
			bust.animation.add("fly", [29, 30, 31, 32, 33, 34, 35, 36], 10, true);
			bust.animation.play("fly");
			bust.origin.set(bust.width / 2, bust.height / 2);
			bust.scale.set(0.5, 0.5);
			bust.updateHitbox();
			FlxG.state.add(bust);
			// ⏱️ 0.5 সেকেন্ড পর bust স্প্রাইট মুছে ফেলো
			new FlxTimer().start(0.5, function(timer:FlxTimer)
				{
					bust.kill();
					bust.destroy();
				});
			
			// ✅ নতুন enemy প্লেন তৈরি করো
			var newEnemy = new EnemyPlane(FlxG.random.float(0, FlxG.width - 100), -FlxG.random.float(0, 300));
			enemies.add(newEnemy);
		});
	}
}
