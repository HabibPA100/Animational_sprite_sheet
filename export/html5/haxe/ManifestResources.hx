package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y32:assets%2Fimages%2Fbackground.jpgR2i364788R3y5:IMAGER5R7R6tgoR0y35:assets%2Fimages%2FbackgroundOne.jpgR2i2284541R3R8R5R9R6tgoR0y37:assets%2Fimages%2FbackgroundThree.jpgR2i1326879R3R8R5R10R6tgoR0y35:assets%2Fimages%2FbackgroundTwo.jpgR2i2531270R3R8R5R11R6tgoR0y26:assets%2Fimages%2Fbust.pngR2i51037R3R8R5R12R6tgoR0y27:assets%2Fimages%2FEnemy.pngR2i411548R3R8R5R13R6tgoR0y32:assets%2Fimages%2FEnemyPlane.pngR2i84431R3R8R5R14R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R15R6tgoR0y35:assets%2Fimages%2FMainPlaneBust.pngR2i528253R3R8R5R16R6tgoR0y32:assets%2Fimages%2Fplane_anim.pngR2i364684R3R8R5R17R6tgoR2i1898616R3y5:MUSICR5y29:assets%2Fmusic%2Fbg_music.mp3y9:pathGroupaR19hR6tgoR2i880004R3R18R5y31:assets%2Fmusic%2Fhome_music.mp3R20aR21hR6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R22R6tgoR2i1048292R3y5:SOUNDR5y27:assets%2Fsounds%2Fboomb.wavR20aR24hR6tgoR2i91115R3R18R5y38:assets%2Fsounds%2FmainPlaneDestroy.mp3R20aR25hR6tgoR2i1197120R3R18R5y38:assets%2Fsounds%2FruningPlaneSound.mp3R20aR26hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R27R6tgoR2i569760R3R18R5y33:assets%2Fsounds%2FvulcanPlane.mp3R20aR28hR6tgoR2i8220R3R18R5y26:flixel%2Fsounds%2Fbeep.mp3R20aR29y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R18R5y28:flixel%2Fsounds%2Fflixel.mp3R20aR31y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i6840R3R23R5R30R20aR29R30hgoR2i33629R3R23R5R32R20aR31R32hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R33R34y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R8R5R39R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R8R5R40R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_background_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundone_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundthree_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundtwo_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bust_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemyplane_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainplanebust_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_plane_anim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_bg_music_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_home_music_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_boomb_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_mainplanedestroy_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_runingplanesound_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vulcanplane_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/background.jpg") @:noCompletion #if display private #end class __ASSET__assets_images_background_jpg extends lime.graphics.Image {}
@:keep @:image("assets/images/backgroundOne.jpg") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundone_jpg extends lime.graphics.Image {}
@:keep @:image("assets/images/backgroundThree.jpg") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundthree_jpg extends lime.graphics.Image {}
@:keep @:image("assets/images/backgroundTwo.jpg") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundtwo_jpg extends lime.graphics.Image {}
@:keep @:image("assets/images/bust.png") @:noCompletion #if display private #end class __ASSET__assets_images_bust_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Enemy.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_png extends lime.graphics.Image {}
@:keep @:image("assets/images/EnemyPlane.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemyplane_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/MainPlaneBust.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainplanebust_png extends lime.graphics.Image {}
@:keep @:image("assets/images/plane_anim.png") @:noCompletion #if display private #end class __ASSET__assets_images_plane_anim_png extends lime.graphics.Image {}
@:keep @:file("assets/music/bg_music.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_bg_music_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/home_music.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_home_music_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/boomb.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_boomb_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mainPlaneDestroy.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_mainplanedestroy_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/runingPlaneSound.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_runingplanesound_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vulcanPlane.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_vulcanplane_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/PCM/Q/flixel/6,0,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/PCM/Q/flixel/6,0,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/PCM/Q/flixel/6,0,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/Users/PCM/Q/flixel/6,0,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/Users/PCM/Q/flixel/6,0,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/Users/PCM/Q/flixel/6,0,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end