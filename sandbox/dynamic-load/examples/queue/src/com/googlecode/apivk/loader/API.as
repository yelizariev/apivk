package com.googlecode.apivk.loader
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.system.LoaderContext;
	import flash.system.ApplicationDomain;

	public class API
	{
		public static var APIVK: *;
		public static var VKQueue: *;
		public static var Messages: *;

		public static function load(onLoad: Function, url: String): void
		{
			var loader:Loader = new Loader();
			var onComplete: Function = function (e: Event): void
			{
				var getDef: Function =  e.target.applicationDomain.getDefinition;
				APIVK = getDef('com.vk.api.APIVK');
				VKQueue = getDef('com.vk.api.utils.VKQueue');
				Messages = getDef('com.vk.api.lib.Messages');
				onLoad();
				e.target.removeEventListener(Event.COMPLETE, onComplete);
			}
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest(url),
			            new LoaderContext(true)
			            );
		}
	}
}