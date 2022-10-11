package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var showFPS:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var shaders:Bool = true;
	public static var newnotesplash:Bool = true;
	public static var modcharts:Bool = true;
	public static var improvedicons:String = 'Forever';
	public static var antimashlol:Bool = false;
	public static var latedamage:Bool = false;
	public static var introskip:Bool = false;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var skillissuelevel:Int = 65;
	public static var beatslol:Int = 2;
	public static var suplove:Int = 0;
	public static var poisonfright:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var debugmode:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var timeBarType:String = 'Time Left';
	public static var deathcountertype:String = 'Faints';
	public static var icontype:String = 'Forever';
	public static var scoreZoom:Bool = true;
	public static var sickmode:Bool = false;
	public static var gfcmode:Bool = false;
	public static var fcmode:Bool = false;
	public static var instakill:Bool = false;
	public static var practice:Bool = false;
	public static var botplay:Bool = false;
	public static var noReset:Bool = false;
	public static var iconbobiguess:Bool = true;
	public static var warnstate:Bool = true;
	public static var healthBarType:String = 'Short';
	public static var healthtype:String = 'New';
	public static var scoretextstyle:String = 'New Alt';
	public static var healthBarAlpha:Float = 1;
	public static var watermarks:Bool = true;
	public static var controllerMode:Bool = false;
	public static var hitsoundVolume:Float = 0;
	public static var healthgain:Float = 1;
	public static var healthloss:Float = 1;
	public static var scrollspeed:Float = 1;
	public static var pauseMusic:String = 'Tea Time';
	public static var menuMusic:String = 'Getting Freaky';
	public static var gameplaySettings:Map<String, Dynamic> = [
		'scrollspeed' => 1.0,
		'scrolltype' => 'multiplicative', 
		// anyone reading this, amod is multiplicative speed mod, cmod is constant speed mod, and xmod is bpm based speed mod.
		// an amod example would be chartSpeed * multiplier
		// cmod would just be constantSpeed = chartSpeed
		// and xmod basically works by basing the speed on the bpm.
		// iirc (beatsPerSecond * (conductorToNoteDifference / 1000)) * noteSize (110 or something like that depending on it, prolly just use note.height)
		// bps is calculated by bpm / 60
		// oh yeah and you'd have to actually convert the difference to seconds which I already do, because this is based on beats and stuff. but it should work
		// just fine. but I wont implement it because I don't know how you handle sustains and other stuff like that.
		// oh yeah when you calculate the bps divide it by the songSpeed or rate because it wont scroll correctly when speeds exist.
		'songspeed' => 1.0,
		'healthgain' => 1.0,
		'healthloss' => 1.0,
		'instakill' => false,
		'practice' => false,
		'botplay' => false,
		'opponentplay' => false
	];

	public static var comboOffset:Array<Int> = [0, 0, 0, 0];
	public static var ratingOffset:Int = 0;
	public static var sickWindow:Int = 45;
	public static var goodWindow:Int = 90;
	public static var badWindow:Int = 135;
	public static var safeFrames:Float = 10;

	//Every key has two binds, add your key bind down here and then add your control on options/ControlsSubState.hx and Controls.hx
	public static var keyBinds:Map<String, Array<FlxKey>> = [
		//Key Bind, Name for ControlsSubState
		'note_left'		=> [A, LEFT],
		'note_down'		=> [S, DOWN],
		'note_up'		=> [W, UP],
		'note_right'	=> [D, RIGHT],
		
		'ui_left'		=> [A, LEFT],
		'ui_down'		=> [S, DOWN],
		'ui_up'			=> [W, UP],
		'ui_right'		=> [D, RIGHT],
		
		'accept'		=> [SPACE, ENTER],
		'back'			=> [BACKSPACE, ESCAPE],
		'pause'			=> [ENTER, ESCAPE],
		'reset'			=> [R, NONE],
		
		'volume_mute'	=> [ZERO, NONE],
		'volume_up'		=> [NUMPADPLUS, PLUS],
		'volume_down'	=> [NUMPADMINUS, MINUS],
		
		'debug_1'		=> [SEVEN, NONE],
		'debug_2'		=> [EIGHT, NONE]
	];
	public static var defaultKeys:Map<String, Array<FlxKey>> = null;

	public static function loadDefaultKeys() {
		defaultKeys = keyBinds.copy();
		//trace(defaultKeys);
	}

	public static function saveSettings() {
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.warnstate = warnstate;
		FlxG.save.data.shaders = shaders;
		FlxG.save.data.icontype = icontype;
		FlxG.save.data.newnotesplash = newnotesplash;
		FlxG.save.data.skillissuelevel = skillissuelevel;
		FlxG.save.data.healthBarType = healthBarType;
		FlxG.save.data.improvedicons = improvedicons;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		FlxG.save.data.sickmode = sickmode;
		FlxG.save.data.gfcmode = gfcmode;
		FlxG.save.data.fcmode = fcmode;
		FlxG.save.data.poisonfright = poisonfright;
		FlxG.save.data.suplove = suplove;
		FlxG.save.data.healthgain = healthgain;
		FlxG.save.data.instakill = instakill;
		FlxG.save.data.healthloss = healthloss;
		FlxG.save.data.practice = practice;
		FlxG.save.data.botplay = botplay;
		FlxG.save.data.scrollspeed = scrollspeed;
		FlxG.save.data.beatslol = beatslol;
		//FlxG.save.data.cursing = cursing;
		//FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.deathcountertype = deathcountertype;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.antimashlol = antimashlol;
		FlxG.save.data.scoretextstyle = scoretextstyle;
		FlxG.save.data.latedamage = latedamage;
		FlxG.save.data.menuMusic = menuMusic;
		FlxG.save.data.modcharts = modcharts;
		FlxG.save.data.iconbobiguess = iconbobiguess;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.timeBarType = timeBarType;
		FlxG.save.data.scoreZoom = scoreZoom;
		FlxG.save.data.introskip = introskip;
		FlxG.save.data.noReset = noReset;
		FlxG.save.data.watermarks = watermarks;
		FlxG.save.data.healthBarAlpha = healthBarAlpha;
		FlxG.save.data.comboOffset = comboOffset;
		FlxG.save.data.healthtype = healthtype;
		FlxG.save.data.achievementsMap = Achievements.achievementsMap;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
		FlxG.save.data.debugmode = debugmode;
		FlxG.save.data.ratingOffset = ratingOffset;
		FlxG.save.data.sickWindow = sickWindow;
		FlxG.save.data.goodWindow = goodWindow;
		FlxG.save.data.badWindow = badWindow;
		FlxG.save.data.safeFrames = safeFrames;
		FlxG.save.data.gameplaySettings = gameplaySettings;
		FlxG.save.data.controllerMode = controllerMode;
		FlxG.save.data.hitsoundVolume = hitsoundVolume;
		FlxG.save.data.pauseMusic = pauseMusic;
	
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = keyBinds;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.downScroll != null) {
			downScroll = FlxG.save.data.downScroll;
		}
		if(FlxG.save.data.middleScroll != null) {
			middleScroll = FlxG.save.data.middleScroll;
		}
		if(FlxG.save.data.suplove != null) {
			suplove = FlxG.save.data.suplove;
		}
		if(FlxG.save.data.poisonfright != null) {
			poisonfright = FlxG.save.data.poisonfright;
		}
		if(FlxG.save.data.newnotesplash != null) {
			newnotesplash = FlxG.save.data.newnotesplash;
		}
		if(FlxG.save.data.showFPS != null) {
			showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = showFPS;
			}
		}
		if(FlxG.save.data.flashing != null) {
			flashing = FlxG.save.data.flashing;
		}
		if(FlxG.save.data.icontype != null) {
			icontype = FlxG.save.data.icontype;
		}
		if(FlxG.save.data.globalAntialiasing != null) {
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if(FlxG.save.data.shaders != null) {
			shaders = FlxG.save.data.shaders;
		}
		if(FlxG.save.data.skillissuelevel != null) {
			skillissuelevel = FlxG.save.data.skillissuelevel;
		}
		if(FlxG.save.data.warnstate != null) {
			warnstate = FlxG.save.data.warnstate;
		}
		if(FlxG.save.data.scoretextstyle != null) {
			scoretextstyle = FlxG.save.data.scoretextstyle;
		}
		if(FlxG.save.data.deathcountertype != null) {
			deathcountertype = FlxG.save.data.deathcountertype;
		}
		if(FlxG.save.data.introskip != null) {
			introskip = FlxG.save.data.introskip;
		}
		if(FlxG.save.data.healthtype != null) {
			healthtype = FlxG.save.data.healthtype;
		}
		if(FlxG.save.data.watermarks != null) {
			watermarks = FlxG.save.data.watermarks;
		}
		if(FlxG.save.data.healthBarType != null) {
			healthBarType = FlxG.save.data.healthBarType;
		}
		if(FlxG.save.data.improvedicons != null) {
			improvedicons = FlxG.save.data.improvedicons;
		}
		if(FlxG.save.data.iconbobiguess != null) {
			iconbobiguess = FlxG.save.data.iconbobiguess;
		}
		if(FlxG.save.data.noteSplashes != null) {
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if(FlxG.save.data.debugmode != null) {
			debugmode = FlxG.save.data.debugmode;
		}
		if(FlxG.save.data.lowQuality != null) {
			lowQuality = FlxG.save.data.lowQuality;
		}
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
			cursing = FlxG.save.data.cursing;
		}
		if(FlxG.save.data.violence != null) {
			violence = FlxG.save.data.violence;
		}*/
		if(FlxG.save.data.camZooms != null) {
			camZooms = FlxG.save.data.camZooms;
		}
		if(FlxG.save.data.hideHud != null) {
			hideHud = FlxG.save.data.hideHud;
		}
		if(FlxG.save.data.noteOffset != null) {
			noteOffset = FlxG.save.data.noteOffset;
		}
		if(FlxG.save.data.modcharts != null) {
			modcharts = FlxG.save.data.modcharts;
		}
		if(FlxG.save.data.latedamage != null) {
			latedamage = FlxG.save.data.latedamage;
		}
		if(FlxG.save.data.antimashlol != null) {
			antimashlol = FlxG.save.data.antimashlol;
		}
		if(FlxG.save.data.arrowHSV != null) {
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if(FlxG.save.data.ghostTapping != null) {
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		if(FlxG.save.data.timeBarType != null) {
			timeBarType = FlxG.save.data.timeBarType;
		}
		if(FlxG.save.data.scoreZoom != null) {
			scoreZoom = FlxG.save.data.scoreZoom;
		}
		if(FlxG.save.data.noReset != null) {
			noReset = FlxG.save.data.noReset;
		}
		if(FlxG.save.data.healthBarAlpha != null) {
			healthBarAlpha = FlxG.save.data.healthBarAlpha;
		}
		if(FlxG.save.data.comboOffset != null) {
			comboOffset = FlxG.save.data.comboOffset;
		}
		
		if(FlxG.save.data.ratingOffset != null) {
			ratingOffset = FlxG.save.data.ratingOffset;
		}
		if(FlxG.save.data.sickWindow != null) {
			sickWindow = FlxG.save.data.sickWindow;
		}
		if(FlxG.save.data.goodWindow != null) {
			goodWindow = FlxG.save.data.goodWindow;
		}
		if(FlxG.save.data.badWindow != null) {
			badWindow = FlxG.save.data.badWindow;
		}
		if(FlxG.save.data.safeFrames != null) {
			safeFrames = FlxG.save.data.safeFrames;
		}
		if(FlxG.save.data.controllerMode != null) {
			controllerMode = FlxG.save.data.controllerMode;
		}
		if(FlxG.save.data.hitsoundVolume != null) {
			hitsoundVolume = FlxG.save.data.hitsoundVolume;
		}
		if(FlxG.save.data.pauseMusic != null) {
			pauseMusic = FlxG.save.data.pauseMusic;
		}
		if(FlxG.save.data.beatslol != null) {
			beatslol = FlxG.save.data.beatslol;
		}
		if(FlxG.save.data.menuMusic != null) {
			menuMusic = FlxG.save.data.menuMusic;
		}
		if(FlxG.save.data.sickmode != null) {
			sickmode = FlxG.save.data.sickmode;
		}
		if(FlxG.save.data.gfcmode != null) {
			gfcmode = FlxG.save.data.gfcmode;
		}
		if(FlxG.save.data.fcmode != null) {
			fcmode = FlxG.save.data.fcmode;
		}
		if(FlxG.save.data.instakill != null) {
			instakill = FlxG.save.data.instakill;
		}
		if(FlxG.save.data.healthgain != null) {
			healthgain = FlxG.save.data.healthgain;
		}
		if(FlxG.save.data.healthloss != null) {
			healthloss = FlxG.save.data.healthloss;
		}
		if(FlxG.save.data.practice != null) {
			practice = FlxG.save.data.practice;
		}
		if(FlxG.save.data.botplay != null) {
			botplay = FlxG.save.data.botplay;
		}
		if(FlxG.save.data.scrollspeed != null) {
			scrollspeed = FlxG.save.data.scrollspeed;
		}
		if(FlxG.save.data.gameplaySettings != null)
		{
			var savedMap:Map<String, Dynamic> = FlxG.save.data.gameplaySettings;
			for (name => value in savedMap)
			{
				gameplaySettings.set(name, value);
			}
		}
		
		// flixel automatically saves your volume!
		if(FlxG.save.data.volume != null)
		{
			FlxG.sound.volume = FlxG.save.data.volume;
		}
		if (FlxG.save.data.mute != null)
		{
			FlxG.sound.muted = FlxG.save.data.mute;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99');
		if(save != null && save.data.customControls != null) {
			var loadedControls:Map<String, Array<FlxKey>> = save.data.customControls;
			for (control => keys in loadedControls) {
				keyBinds.set(control, keys);
			}
			reloadControls();
		}
	}

	inline public static function getGameplaySetting(name:String, defaultValue:Dynamic):Dynamic {
		return /*PlayState.isStoryMode ? defaultValue : */ (gameplaySettings.exists(name) ? gameplaySettings.get(name) : defaultValue);
	}

	public static function reloadControls() {
		PlayerSettings.player1.controls.setKeyboardScheme(KeyboardScheme.Solo);

		TitleState.muteKeys = copyKey(keyBinds.get('volume_mute'));
		TitleState.volumeDownKeys = copyKey(keyBinds.get('volume_down'));
		TitleState.volumeUpKeys = copyKey(keyBinds.get('volume_up'));
		FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;
	}
	public static function copyKey(arrayToCopy:Array<FlxKey>):Array<FlxKey> {
		var copiedArray:Array<FlxKey> = arrayToCopy.copy();
		var i:Int = 0;
		var len:Int = copiedArray.length;

		while (i < len) {
			if(copiedArray[i] == NONE) {
				copiedArray.remove(NONE);
				--i;
			}
			i++;
			len = copiedArray.length;
		}
		return copiedArray;
	}
}
