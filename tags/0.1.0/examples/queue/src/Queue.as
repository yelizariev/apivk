package
{
	import flash.display.Sprite;

	import com.vk.api.APIVK;
	import com.vk.api.lib.Messages;

	import com.googlecode.apivk.util.VKQueue
	/**
	 * Исользуемый класс com.googlecode.apivk.util.VKQueue создает
	 * очередь запросов для предотвращения ошибки 6 "Too many requests
	 * per second"
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
			           true //isTestMode
			           );
			VKQueue.init(400);// интервал между запросами в миллисекундах

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

			VKQueue.addReq(Messages.getMessages(), onReceived, onError);
		}
		private static function onSent(data: XML): void
		{
			trace('msg sent');
		}
		private static function onReceived(data: XML): void
		{
			trace('receive:\n'+data);
		}
		private static function onError(
		                         errorCode: String,
		                         errorMsg: String,
		                         reqParams: XML
		                         ): void
		{
			trace('Error '+errorCode+': '+errorMsg);
		}
	}
}