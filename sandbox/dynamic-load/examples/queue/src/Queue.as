package
{
	import flash.display.Sprite;

	import com.vk.api.APIVK;
	import com.vk.api.utils.VKQueue;
	import com.vk.api.lib.Messages;

	/**
	 * Класс VKQueue создает очередь запросов для предотвращения ошибки
	 * 6 "Too many requests per second"
	 *
	 */
	public class Queue extends Sprite
	{
		public function Queue()
		{
			APIVK.init(
			           'http://api.vkontakte.ru/api.php', //api_url
			           '1857932', //viewer_id
			           '1735731', //api_id
			           'secret', //secret
			           APIVK.JSON, //format
			           true //isTestMode
			           );
			VKQueue.init(
			             400,// интервал между запросами в миллисекундах
			             APIVK.JSON //формат ответа от сервера
			             );

			VKQueue.addReq(Messages.sendMessage('H'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('e'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('l'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('l'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('o'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage(','), onSent, onError);
			VKQueue.addReq(Messages.sendMessage(' '), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('W'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('o'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('r'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('l'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('d'), onSent, onError);
			VKQueue.addReq(Messages.sendMessage('!'), onSent, onError);

			VKQueue.addReq(Messages.getMessages(), onReceive, onError);
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
