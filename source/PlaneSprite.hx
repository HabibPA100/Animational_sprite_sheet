package;

import Bullet;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

class PlaneSprite extends FlxSprite
{
	public var bullets:FlxGroup;


    public function new(x:Float, y:Float) {
        super(x, y);

        // প্লেন ইমেজ লোড
		super.loadGraphic("assets/images/plane_anim.png", true, 200, 200); // true মানে এটা animated
        animation.add("fly", [0, 1, 2, 3, 4, 5, 6, 7], 10, true); // ফ্রেম 0-3, প্রতি সেকেন্ডে 10 বার
		animation.play("fly");
		origin.set(width / 2, height / 2);
        scale.set(0.5, 0.5);
        updateHitbox();
        this.x = (FlxG.width/2) - (width/2);
        this.y = (FlxG.height/2) - (height/2);
		// গুলির গ্রুপকে স্ক্রিনে যুক্ত করো
		bullets = new FlxGroup();
		FlxG.state.add(bullets); 
    }
    

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.pressed.LEFT) {
            if(angle > -45) 
                angle -= 1;
        } else if( angle < 0){
            angle += 1;
            if(angle > 0)
                angle = 0;
		}
		if (FlxG.keys.justPressed.LEFT)
		{
			this.x -= 10;
		}
		if (FlxG.keys.pressed.D)
		{
			this.x -= 10;
		}

       if (FlxG.keys.pressed.RIGHT) {
            if(angle < 45)
                angle += 1;
        } else if (angle > 0){
            angle -= 1;
            if(angle < 0)
                angle = 0;
        }
        if(FlxG.keys.justPressed.RIGHT){
            this.x += 10;
		}
		if (FlxG.keys.pressed.A)
		{
			this.x += 10;
		}

        if(FlxG.keys.pressed.UP){
            velocity.y = -100;
        } else if(FlxG.keys.pressed.DOWN){
            velocity.y = 100;
        } else{
            velocity.y = 0;
        }

        if(FlxG.keys.justPressed.SPACE){
            this.x = (FlxG.width/2) - width/2;
            this.y = (FlxG.height/2) - height/2;
        }
		if (FlxG.keys.pressed.LEFT && FlxG.keys.pressed.UP)
		{
			this.x -= 5;
		}
		else if (FlxG.keys.pressed.RIGHT && FlxG.keys.pressed.UP)
		{
			this.x += 5;
		}
		else
		{
			velocity.x = 0;
		}
		if (FlxG.keys.pressed.G)
		{
			var rad = (angle - 90) * Math.PI / 180;
			var offset = 50;

			var midpoint = getMidpoint();
			var centerX = midpoint.x;
			var centerY = midpoint.y;

			// মাঝখান থেকে গুলি
			var bullet1 = new Bullet(centerX + Math.cos(rad) * offset, centerY + Math.sin(rad) * offset, angle);

			// বাম পাখা থেকে গুলি (mid থেকে -50px)
			var bullet2X = centerX - Math.sin(rad) * 15 + Math.cos(rad) * offset;
			var bullet2Y = centerY + Math.cos(rad) * 15 + Math.sin(rad) * offset;
			var bullet2 = new Bullet(bullet2X, bullet2Y, angle);

			// ডান পাখা থেকে গুলি (mid থেকে +50px)
			var bullet3X = centerX + Math.sin(rad) * 15 + Math.cos(rad) * offset;
			var bullet3Y = centerY - Math.cos(rad) * 15 + Math.sin(rad) * offset;
			var bullet3 = new Bullet(bullet3X, bullet3Y, angle);

			// সব গুলি যুক্ত করো
			bullets.add(bullet1);
			bullets.add(bullet2);
			bullets.add(bullet3);
			FlxG.sound.play("assets/sounds/boomb.wav");
		}
                 
    }
}