package
{
	import flash.display.Sprite;
	import flash.system.Security;
	import com.vk.api.APIVK;
	import com.vk.api.VKQueue;
	import com.vk.api.lib.*;

	public class APIVKSWF extends Sprite
	{
		public function APIVKSWF():void
		{
			Security.allowDomain( "*" );
			var fix: Array = [
			                 APIVK,
			                 VKQueue,
			                 Audio,
			                 Geo,
			                 HighScores,
			                 Language,
			                 Messages,
			                 Misc,
			                 Offers,
			                 Pages,
			                 Photos,
			                 Ques,
			                 SMS,
			                 User,
			                 UserField,
			                 UserNameCase,
			                 UserSett,
			                 Variables,
			                 Wall
			                 ];
		}
	}
}