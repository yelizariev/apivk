package
{
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;

	import com.vk.api.APIVK;
	import com.vk.api.lib.Misc;

	public class Unixtime extends Sprite
	{
		public function Unixtime()
		{
			APIVK.init(
			           'http://api.vkontakte.ru/api.php', //api_url
			           '1857932', //viewer_id
			           '1735731', //api_id
			           'secret', //secret
			           true //isTestMode
			           );
			var req: URLRequest = Misc.getServerTime();
			var loader: URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load(req);
		}
		private function onComplete(e: Event): void
		{
			trace('response:\n' + e.target.data);
		}
	}
}
