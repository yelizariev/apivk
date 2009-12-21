package
{
	import flash.display.Sprite;

	import com.googlecode.apivk.loader.API;

	/**
	 * Класс VKQueue создает очередь запросов для предотвращения ошибки
	 * 6 "Too many requests per second"
	 *
	 */
	public class Queue extends Sprite
	{
		public function Queue()
		{
			API.load(init, 'http://cs4726.vkontakte.ru/u1857932/15ea5149a702f8.zip');
		}
		private function init(): void
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

			API.VKQueue.addReq(API.Messages.sendMessage('H'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('e'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('l'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('l'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('o'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage(','), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage(' '), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('W'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('o'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('r'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('l'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('d'), onSent, onError);
			API.VKQueue.addReq(API.Messages.sendMessage('!'), onSent, onError);

			API.VKQueue.addReq(API.Messages.getMessages(), onReceive, onError);
		}
		private static function onSent(data: Object): void
		{
			trace('msg sent');
		}
		private static function onReceive(data: Object): void
		{
			for each (var msg: Object in data)
				trace('time: '        + msg.time      +
				      ', user_id: '   + msg.user_id   +
				      ', user_name: ' + msg.user_name +
				      ', message: '   + msg.message
				      );
		}
		private static function onError(
		                         errorCode: String,
		                         errorMsg: String,
		                         reqParams: *
		                         ): void
		{
			trace('Error '+errorCode+': '+errorMsg);
		}
	}
}
