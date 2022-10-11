package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import openfl.Lib;

using StringTools;

class ModifiersSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Modifiers';
		rpcTitle = 'Modifiers Menu'; //for Discord Rich Presence

		var option:Option = new Option('Practice Mode',
		'Baby mode initiate. Practice your songs however you want, you won\'t be dying anytime soon. However this will disable your score',
		'practice',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('True Perfect (MFC)',
		'Good Luck Man, Seriously you need it. Score one good rating and it\'s over.',
		'sickmode',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Bad Trip (GFC)',
		'Locomotion issues. I get it. Score one bad rating and it\'s over.',
		'gfcmode',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Terrible Ending (FC)',
		'Get a single Shit rating or lower and it\'s all over',
		'fcmode',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Perfect! (FC-)',
		'Miss a single note and it\'s all over.',
		'instakill',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Supportive Love:',
		'Health Regeneration basically, higher the number the more health you gain overtime',
		'suplove',
		'float',
		0);
		option.scrollSpeed = 50;
		option.minValue = 0;
		option.maxValue = 500;
		option.changeValue = 1;
		option.displayFormat = '%v%';
		addOption(option);

		var option:Option = new Option('Poison Fright:',
		'Poison, higher the number the more health you suffer overtime\n(WARNING: CAN KILL YOU IF SET TOO HIGH)',
		'poisonfright',
		'float',
		0);
		option.scrollSpeed = 50;
		option.minValue = 0;
		option.maxValue = 500;
		option.changeValue = 1;
		option.displayFormat = '%v%';
		addOption(option);

		var option:Option = new Option('Scroll Speed:',
		'Changes the scroll speed. Simple enough',
		'scrollspeed',
		'float',
		1);
		option.scrollSpeed = 1.5;
		option.minValue = 0.5;
		option.maxValue = 3;
		option.changeValue = 0.1;
		option.displayFormat = '%vX';
		addOption(option);

		var option:Option = new Option('Health Gain Multiplier:', 
		'The higher the multiplier, the more health you get when hitting a note.',
		'healthgain', 
		'float', 
		1);
		option.scrollSpeed = 2.5;
		option.minValue = 0;
		option.maxValue = 5;
		option.changeValue = 0.1;
		option.displayFormat = '%vX';
		addOption(option);

		var option:Option = new Option('Health Loss Multiplier:', 
		'The higher the multiplier, the more health you lose when missing.',
		'healthloss', 
		'float', 
		1);
		option.scrollSpeed = 2.5;
		option.minValue = 0;
		option.maxValue = 5;
		option.changeValue = 0.1;
		option.displayFormat = '%vX';
		addOption(option);

		// Look here you shouldn't really enable more modifiers that are basically similar. like FC and GFC, still kinda buggy tho.
		if (ClientPrefs.sickmode) {
			ClientPrefs.gfcmode = false;
			ClientPrefs.fcmode = false;
			ClientPrefs.instakill = false;
			ClientPrefs.practice = false;
		}
		if (ClientPrefs.gfcmode) {
			ClientPrefs.sickmode = false;
			ClientPrefs.fcmode = false;
			ClientPrefs.instakill = false;
			ClientPrefs.practice = false;
		}
		if (ClientPrefs.fcmode) {
			ClientPrefs.sickmode = false;
			ClientPrefs.gfcmode = false;
			ClientPrefs.instakill = false;
			ClientPrefs.practice = false;
		}
		if (ClientPrefs.instakill) {
			ClientPrefs.sickmode = false;
			ClientPrefs.gfcmode = false;
			ClientPrefs.fcmode = false;
			ClientPrefs.practice = false;
		}
		if (ClientPrefs.practice) {
			ClientPrefs.sickmode = false;
			ClientPrefs.fcmode = false;
			ClientPrefs.instakill = false;
			ClientPrefs.gfcmode = false;
		}

		super();
	}

	function onChangeAntiAliasing()
	{
		for (sprite in members)
		{
			var sprite:Dynamic = sprite; //Make it check for FlxSprite instead of FlxBasic
			var sprite:FlxSprite = sprite; //Don't judge me ok
			if(sprite != null && (sprite is FlxSprite) && !(sprite is FlxText)) {
				sprite.antialiasing = ClientPrefs.globalAntialiasing;
			}
		}
	}

	function onChangeFramerate()
	{
		if(ClientPrefs.framerate > FlxG.drawFramerate)
		{
			FlxG.updateFramerate = ClientPrefs.framerate;
			FlxG.drawFramerate = ClientPrefs.framerate;
		}
		else
		{
			FlxG.drawFramerate = ClientPrefs.framerate;
			FlxG.updateFramerate = ClientPrefs.framerate;
		}
	}
}