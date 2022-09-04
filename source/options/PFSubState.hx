package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
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

using StringTools;

class PFSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Psych Forever Settings';
		rpcTitle = 'Psych Forever Settings Menu'; //for Discord Rich Presence

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Judgement Counter', //Name
			'If checked, the judgement counter will show.\n(Hud elements must be visible!)', //Description
			'judgementstuff', //Save data variable name
			'bool', //Variable type
			true); //Default value
		addOption(option);

		var option:Option = new Option('New Accuracy',
			'If checked, the accuracy will increase from long notes.',
			'newaccuracy',
			'bool',
			true);
		addOption(option);
	
	/*	var option:Option = new Option('Anti-Mash',
			"If enabled, mashing will make you miss.",
			'antimash',
			'bool',
			false);
		addOption(option);*/

		// I'm probably just dumb or something but this doesn't work for some reason

		var option:Option = new Option('Icon Turn',
			"If checked, the icons will turn on beat.",
			'forevericonbop',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Opponent Note Splash',
			"If checked, every time the opponent hits a note they will also have note splashes.\n(Reccomended Off)",
			'opponentsplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Watermarks',
			'If checked, The song name will show on screen.',
			'watermarks',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Engine Watermark',
			"If checked, the engine version will show on screen.",
			'enginewatermarks',
			'bool',
			true);
		addOption(option);

	/*	var option:Option = new Option('Skip Splash',
			'If checked, opening the game will skip the splash.',
			'skipintrosplash',
			'bool',
			false);
		addOption(option);*/

		super();
	}
}