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

class ModdedSpecificSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Psych Forever Setings';
		rpcTitle = 'Psych Forever Settings Menu'; //for Discord Rich Presence

		/*
		var option:Option = new Option('Modcharts',
		'If checked, It enables modcharts from Kade Engine, simple Enough. (WORK IN PROGRESS)', // Turn this off if you're a pussy, unless story mode breaks it or something then ok.
		'modcharts',
		'bool',
		true);
		addOption(option);*/

		var option:Option = new Option('Botplay',
		'If checked, The bot will play the game for you. However you can\'t get any score.',
		'botplay',
		'bool',
		false);
		addOption(option);

		var option:Option = new Option('Icons:',
		'Changes the icon type, either 3 grid (Forever), 5 grid (Advanced), or the og 2 grid (Old)',
		'improvedicons',
		'string',
		'Forever',
		['Forever', 'Advanced', 'Old']);
		addOption(option);

		var option:Option = new Option('Icon Style:',
		'Changes the icon style, simple enough. (Only works with 3 grid / Forever)',
		'icontype',
		'string',
		'Forever',
		['Forever', 'Mic\'d Up', 'Vanilla']);
		addOption(option);

		var option:Option = new Option('New Note Splash',
		'If checked, It will use the forever note splash. Disable this if the mod uses a custom note splash and makes it off place.',
		'newnotesplash',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Shaders',
		'If checked, Shaders will run (reccomended off if you are senitive to flashing lights or lag)',
		'shaders',
		'bool',
		true);
		addOption(option);

	/*	var option:Option = new Option('Icon Bop Type:',
		'Changes how the Icon bops, simple enough',
		'iconbobiguess',
		'string',
		'New',
		['Psych', 'Psych + Turn', 'Ping Pong', 'Disabled']);
		addOption(option);*/

		var option:Option = new Option('Icon Bop',
		'If checked, The icon will bop.',
		'iconbobiguess',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Score Text:',
		'Changes how the score appears, simple enough.',
		'scoretextstyle',
		'string',
		'New Alt',
		['New', 'New Alt', 'Psych', 'Kade Engine', 'Score Only']);
		addOption(option);

		var option:Option = new Option('Health Type:',
		'Changes the health gain. New is large HP gain, no long note healing. Psych is normal. And Old is Low Health gain.',
		'healthtype',
		'string',
		'New',
		['New', 'Psych', 'Old']);
		addOption(option);

		var option:Option = new Option('Health Bar:',
		'Changes the health bar length (This will not give you more health).',
		'healthBarType',
		'string',
		'Short',
		['Long', 'Medium', 'Short']);
		addOption(option);

		var option:Option = new Option('Skip Intro', //Name
		'If checked, you will go straight to the title screen without an intro.', //Description
		'introskip', //Save data variable name
		'bool', //Variable type
		false); //Default value
		addOption(option);

		var option:Option = new Option('Enable Warning', //Name
		'If checked, you will go to the warning screen after the title (Reccomended off)', //Description
		'warnstate', //Save data variable name
		'bool', //Variable type
		false); //Default value
		addOption(option);

		var option:Option = new Option('Late Damage', //Name
		'If checked, Getting bads and shits will hurt you\nAs well shits making you miss', //Description
		'lateDamage', //Save data variable name
		'bool', //Variable type
		false); //Default value
		addOption(option);

		var option:Option = new Option('Anti-Mash', //Name
		'If checked, mashing your notes will cause a penalty', //Description
		'antimashlol', //Save data variable name
		'bool', //Variable type
		false); //Default value
		addOption(option);

	/*	var option:Option = new Option('Icon beat rate',
		'The higher the number the more beats before the icon bops.',
		'beatslol',
		'int',
		2);
		option.minValue = 1;
		option.maxValue = 4;
		addOption(option);*/

		var option:Option = new Option('Skill Issue Misses:',
		'The higher the number the more misses you need to get a Skill Issue Rank',
		'skillissuelevel',
		'int',
		65);
		option.scrollSpeed = 60;
		option.minValue = 30;
		option.maxValue = 200;
		addOption(option);

		var option:Option = new Option('Menu Music:',
		"What song do you prefer for the main menu?",
		'menuMusic',
		'string',
		'Getting Freaky',
		['Getting Freaky', 'B-Sides', 'Funky', 'Tea Time']);
		addOption(option);
		option.onChange = onChangeMenuMusic;

		var option:Option = new Option('Death Counter Display:',
		"Changes the death counter display on the pause screen.",
		'deathcountertype',
		'string',
		'Faints',
		['Faints', 'Deaths', 'Blueballed']);
		addOption(option);

		var option:Option = new Option('Song Watermarks',
		'If checked, It will show the song info on the bottom right, as well with credits.',
		'watermarks',
		'bool',
		true);
		addOption(option);

		var option:Option = new Option('Debug Mode',
		'If checked, You are able to use chart editor and stuff like that. Not Reccomended for Normal Gameplay',
		'debugmode',
		'bool',
		false);
		addOption(option);

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

	var changedMusic:Bool = false;
	function onChangeMenuMusic()
	{
		if(ClientPrefs.menuMusic == 'None')
			FlxG.sound.music.volume = 0;
		else
			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.menuMusic)));

		changedMusic = true;
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