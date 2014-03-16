
typedef S = flash.media.Sound;

#if !html5

@:sound("kill.wav")
@:keep class Kill extends S {
}

@:sound("walk.wav")
@:keep class Walk extends S {
}

@:sound("sword.wav")
@:keep class Sword extends S {
}

@:sound("notsure.wav")
@:keep class Chest extends S {
}

@:sound("pii.wav")
@:keep class Menu extends S {
}

@:sound("fireball.wav")
@:keep class Fireball extends S {
}

@:sound("world_remove.wav")
@:keep class Open extends S {
}

@:sound("save.wav")
@:keep class Save extends S {
}

@:sound("gameover.wav")
@:keep class GameOver extends S {
}

@:sound("firehit.wav")
@:keep class FireHit extends S {
}

@:sound("npc.wav")
@:keep class Npc extends S {
}

@:sound("princess.wav")
@:keep class Princess extends S {
}

@:sound("puzzle.wav")
@:keep class Puzzle extends S {
}

@:sound("levelup.wav")
@:keep class Levelup extends S {
}

@:sound("hit.wav")
@:keep class Hit extends S {
}

#end


class Sounds {
	
	static var sounds = new Map();
	
	public static function play( name : String ) {
		if( !Game.props.sounds )
			return;
		var s : S = sounds.get(name);
		if( s == null ) {
			#if !html5
			var cl = Type.resolveClass(name.charAt(0).toUpperCase() + name.substr(1));
			if( cl == null ) throw "No sound " + name;
			s = Type.createInstance(cl, []);
			#else
			name = switch (name) {
				case "chest": "notsure";
				case "menu": "pii";
				case "open": "world_remove";
				default: name.toLowerCase ();
			}
			s = openfl.Assets.getSound("sfx/" + name + ".wav");
			#end
			sounds.set(name, s);
		}
		s.play();
	}
	
}