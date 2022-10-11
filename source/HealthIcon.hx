package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String) {
		if(this.char != char) {
			if (ClientPrefs.improvedicons == 'Advanced') {
			var name:String = 'advancedicons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'advancedicons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'advancedicons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);

			loadGraphic(file, true, 150, 150);
			animation.add(char, [0, 1, 2, 3, 4], 0, false, isPlayer);
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
		else if (ClientPrefs.improvedicons == 'Forever') {
			if (ClientPrefs.icontype == 'Forever') {
			var name:String = 'forevericons/forever/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/forever/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/icon-' + char; //Prevents crash from missing icon
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/extra/icon-' + char; //Prevents crash from missing icon
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/icon-awesomface'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);

			loadGraphic(file, true, 150, 150);
			animation.add(char, [1, 2, 0], 0, false, isPlayer);
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
			}
			if (ClientPrefs.icontype == 'Mic\'d Up') {
				var name:String = 'forevericons/micdup/' + char;
				if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/micdup/icon-' + char; //Older versions of psych engine's support
				if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/icon-' + char; //Prevents crash from missing icon
				if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/extra/icon-' + char; //Prevents crash from missing icon
				if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/icon-awesomface'; //Prevents crash from missing icon

				var file:Dynamic = Paths.image(name);

				loadGraphic(file, true, 150, 150);
				animation.add(char, [1, 2, 0], 0, false, isPlayer);
				animation.play(char);
				this.char = char;
	
				antialiasing = ClientPrefs.globalAntialiasing;
				if(char.endsWith('-pixel')) {
					antialiasing = false;
				}
			}
			else if (ClientPrefs.icontype == 'Vanilla') {
			var name:String = 'forevericons/vanilla/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/vanilla/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/icon-' + char; //Prevents crash from missing icon
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/extra/icon-' + char; //Prevents crash from missing icon
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'forevericons/icon-awesomface'; //Prevents crash from missing icon

			var file:Dynamic = Paths.image(name);

			loadGraphic(file, true, 150, 150);
			animation.add(char, [1, 2, 0], 0, false, isPlayer);
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
			}
		}
		else {
			var name:String = 'icons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);

			loadGraphic(file, true, 150, 150);
			animation.add(char, [0, 1, 0], 0, false, isPlayer);
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
		}
	}
	
//	public function updateHitbox() {
//	if (ClientPrefs.iconbobiguess == 'Psych' || ClientPrefs.iconbobiguess == 'Psych + Turn' || ClientPrefs.iconbobiguess == 'Ping Pong') {
/*	override function updateHitbox()
		{
			super.updateHitbox();
			offset.x = iconOffsets[0];
			offset.y = iconOffsets[1];
		
		}*/
//	}
//}

	public function getCharacter():String {
		return char;
	}
}
