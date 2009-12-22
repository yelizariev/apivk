package
{
	import flash.display.Sprite;

	import com.vk.api.API;

	/**
	 * Класс API динамически загружает библиотеку apivk
	 */
	public class Dynamic extends Sprite
	{
		public function Dynamic()
		{
			API.load(onLoadAPIVK, 'http://cs4726.vkontakte.ru/u1857932/15ea5149a702f8.zip');
		}
		private function onLoadAPIVK(): void
		{
			API.APIVK.init(
			           'http://api.vkontakte.ru/api.php', //api_url
			           '1857932', //viewer_id
			           '1735731', //api_id
			           'secret', //secret
			           API.APIVK.JSON, //format
			           true //isTestMode
			           );
			API.VKQueue.init(
			             400,// интервал между запросами в миллисекундах
			             API.APIVK.JSON //формат ответа от сервера
			             );
			API.VKQueue.addReq(API.Messages.sendMessage('A'), onSent);
			API.VKQueue.addReq(API.Messages.sendMessage('P'), onSent);
			API.VKQueue.addReq(API.Messages.sendMessage('I'), onSent);
		}
		private static function onSent(data: Object): void
		{
			trace('msg sent');
		}
	}
}
