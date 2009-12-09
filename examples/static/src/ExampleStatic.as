package
{
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;

	import com.vk.api.APIVK;
	import com.vk.api.lib.HighScores;

	public class ExampleStatic extends Sprite
	{
		public function ExampleStatic()
		{
			APIVK.init(
			           '1857932', //viewer_id
			           '1735731', //api_id
			           'secret', //secret
			           true //isTestMode
			           );
			var req: URLRequest = HighScores.setUserScore('9000');
			var loader: URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load(req);
		}
		private function onComplete(e: Event): void
		{
			trace('response: ' + e.data);
		}
	}
}
