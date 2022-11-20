package;

/*import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import meta.CoolUtil;
import meta.InfoHud;
import meta.data.Conductor;
import meta.data.Timings;
import meta.state.PlayState;

using StringTools;

public var scoreTxt:FlxText;
var timeTxt:FlxText;
var scoreTxtTween:FlxTween;
var judgementCounter:FlxText;

private var timeBarBG:AttachedSprite;
public var timeBar:FlxBar;

private var healthBarBG:AttachedSprite;
public var healthBar:FlxBar;

public var iconP1:HealthIcon;
public var iconP2:HealthIcon;

class ClassHUD extends FlxTypedGroup<FlxBasic>
{
    var showTime:Bool = (ClientPrefs.timeBarType != 'Disabled');
    timeTxt = new FlxText(STRUM_X + (FlxG.width / 2) - 248, 19, 400, "", 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderSize = 2;
    timeTxt.visible = showTime;
    if(ClientPrefs.downScroll) timeTxt.y = FlxG.height - 44;

    if(ClientPrefs.timeBarType == 'Song Name')
    {
        timeTxt.text = '- ${SONG.song} -';
    }
    PlayState.updateTime = showTime;

    hudBeat = 0;

    timeBarBG = new AttachedSprite('timeBar');
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.scrollFactor.set();
    timeBarBG.alpha = 0;
    timeBarBG.visible = showTime;
    timeBarBG.color = FlxColor.BLACK;
    timeBarBG.xAdd = -4;
    timeBarBG.yAdd = -4;
    add(timeBarBG);

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), this,
        'songPercent', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF000000, 0xFFFFFFFF);
    timeBar.numDivisions = 800; //How much lag this causes?? Should i tone it down to idk, 400 or 200?
    timeBar.alpha = 0;
    timeBar.visible = showTime;
    add(timeBar);
    add(timeTxt);
    timeBarBG.sprTracker = timeBar;

    healthBarBG = new AttachedSprite('healthBar');
    healthBarBG.y = FlxG.height * 0.89;
    healthBarBG.screenCenter(X);
    healthBarBG.scrollFactor.set();
    healthBarBG.visible = !ClientPrefs.hideHud;
    healthBarBG.xAdd = -4;
    healthBarBG.yAdd = -4;
    add(healthBarBG);
    if(ClientPrefs.downScroll) healthBarBG.y = 0.11 * FlxG.height;

    healthBar = new FlxBar(healthBarBG.x + 4, healthBarBG.y + 4, RIGHT_TO_LEFT, Std.int(healthBarBG.width - 8), Std.int(healthBarBG.height - 8), this,
        'health', 0, 2);
    healthBar.scrollFactor.set();
    // healthBar
    healthBar.visible = !ClientPrefs.hideHud;
    healthBar.alpha = ClientPrefs.healthBarAlpha;
    add(healthBar);
    healthBarBG.sprTracker = healthBar;

    iconP1 = new HealthIcon(boyfriend.healthIcon, true);
    iconP1.y = healthBar.y - 75;
    iconP1.visible = !ClientPrefs.hideHud;
    iconP1.alpha = ClientPrefs.healthBarAlpha;
    add(iconP1);

    iconP2 = new HealthIcon(dad.healthIcon, false);
    iconP2.y = healthBar.y - 75;
    iconP2.visible = !ClientPrefs.hideHud;
    iconP2.alpha = ClientPrefs.healthBarAlpha;
    add(iconP2);
    reloadHealthBarColors();

    scoreTxt = new FlxText(0, healthBarBG.y + 36, FlxG.width, "", 20);
    scoreTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    scoreTxt.scrollFactor.set();
    scoreTxt.borderSize = 1.25;
    scoreTxt.visible = !ClientPrefs.hideHud;
    add(scoreTxt);

    judgementCounter = new FlxText(20, 0, 0, "", 20);
    judgementCounter.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    judgementCounter.borderSize = 1;
    judgementCounter.borderQuality = 2;
    judgementCounter.scrollFactor.set();
    judgementCounter.cameras = [camHUD];
    judgementCounter.visible = (!ClientPrefs.hideHud || ClientPrefs.judgementstuff);
    judgementCounter.screenCenter(Y);
    if (!ClientPrefs.hideHud)
    {
        add(judgementCounter);
    }
}

override function onUpdate(elapsed:Float) {

    judgementCounter.text = 'Sicks: ${sicks} (${sickrows})\nGoods: ${goods}\nBads: ${bads}\nShits: ${shits}\n';

    var mult:Float = FlxMath.lerp(1, iconP1.scale.x, CoolUtil.boundTo(1 - (elapsed * 9), 0, 1));
    iconP1.scale.set(mult, mult);
    iconP1.updateHitbox();

    var mult:Float = FlxMath.lerp(1, iconP2.scale.x, CoolUtil.boundTo(1 - (elapsed * 9), 0, 1));
    iconP2.scale.set(mult, mult);
    iconP2.updateHitbox();

    var iconOffset:Int = 26;

    iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01)) + (150 * iconP1.scale.x - 150) / 2 - iconOffset;
    iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01)) - (150 * iconP2.scale.x) / 2 - iconOffset * 2;

    if (health > 2)
        health = 2;

    if (healthBar.percent <= 20) {
        iconP1.animation.curAnim.curFrame = 1;
        iconP2.animation.curAnim.curFrame = 2;
    }
    else if (healthBar.percent >= 80) {
        iconP1.animation.curAnim.curFrame = 2;
        iconP2.animation.curAnim.curFrame = 1;
    }
    else {
        iconP1.animation.curAnim.curFrame = 0;
        iconP2.animation.curAnim.curFrame = 0;
    }
}

override function beatHit() {
	iconP1.scale.set(1.2, 1.2);
	iconP2.scale.set(1.2, 1.2);

    hudBeat++;

	if (ClientPrefs.forevericonbop) {
	if (hudBeat % 2 == 0) {
		FlxTween.angle(iconP1, -15, 0, Conductor.crochet / 1300 * PlayState.idiotSpeed, {ease: FlxEase.quadOut});
		FlxTween.angle(iconP2, 15, 0, Conductor.crochet / 1300 * PlayState.idiotSpeed, {ease: FlxEase.quadOut});
	}
	else {
		FlxTween.angle(iconP1, 15, 0, Conductor.crochet / 1300 * PlayState.idiotSpeed, {ease: FlxEase.quadOut});
		FlxTween.angle(iconP2, -15, 0, Conductor.crochet / 1300 * PlayState.idiotSpeed, {ease: FlxEase.quadOut});
	}
	}

	iconP1.updateHitbox();
	iconP2.updateHitbox();
}*/