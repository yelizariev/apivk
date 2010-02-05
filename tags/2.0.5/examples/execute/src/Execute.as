package
{
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;

	import com.vk.api.APIVK;

	public class Execute extends Sprite
	{
		public function Execute()
		{
			APIVK.init(
			           'http://api.vkontakte.ru/api.php', //api_url
			           '1857932', //viewer_id
			           '1735731', //api_id
			           'secret', //secret
			           APIVK.JSON, //format
			           true //isTestMode
			           );
			var code: String = '';
			code += 'var a=API.audio.search({"q":"Beatles","count":3});';
			code += 'var b=a@.owner_id;';
			code += 'var c=API.getProfiles({"uids":b});';
			code += 'return c@.last_name;';

			var req: URLRequest = APIVK.execute(code);
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
