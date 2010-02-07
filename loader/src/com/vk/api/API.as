// -*- coding: utf-8 -*-

// Copyright (c) 2009-2010 The apivk.googlecode.com project Authors.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

// url in repo: $URL$
// Author   of current version: $Author$
// Date     of current version: $Date$
// Revision of current version: $Rev$

package com.vk.api
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.system.LoaderContext;
	import flash.system.ApplicationDomain;

	/**
	 * Динамическая загрузка библиотеки apivk.
	 * <p>Данный класс не включён в библиотеку apivk.swc</p>
	 *
	 * @example
	 * <listing>
	 *  import flash.display.Sprite;
	 *  import com.vk.api.API;
	 *
	 *  public class Dynamic extends Sprite
	 *  {
	 *    public function Dynamic()
	 *    {
	 *      API.load(onLoadAPIVK, 'http://cs4726.vkontakte.ru/u1857932/15ea5149a702f8.zip');
	 *    }
	 *    private function onLoadAPIVK(): void
	 *    {
	 *      API.APIVK.init(
	 *                 'http://api.vkontakte.ru/api.php', //api_url
	 *                 '1857932', //viewer_id
	 *                 '1735731', //api_id
	 *                 'secret', //secret
	 *                 API.APIVK.JSON, //format
	 *                 true //isTestMode
	 *                 );
	 *      API.VKQueue.init(
	 *                   400,// интервал между запросами в миллисекундах
	 *                   API.APIVK.JSON //формат ответа от сервера
	 *                   );
	 *      API.VKQueue.addReq(API.Messages.sendMessage('A'), onSent);
	 *      API.VKQueue.addReq(API.Messages.sendMessage('P'), onSent);
	 *      API.VKQueue.addReq(API.Messages.sendMessage('I'), onSent);
	 *    }
	 *    private static function onSent(data: Object): void
	 *    {
	 *      trace('msg sent');
	 *    }
	 *  }
	 * </listing>
	 **/
	public class API
	{
		public static var MD5 : *;
		public static var JSON: *;

		public static var APIVK        : *;
		public static var VKQueue      : *;

		public static var Audio        : *;
		public static var Geo          : *;
		public static var HighScores   : *;
		public static var Language     : *;
		public static var Messages     : *;
		public static var Misc         : *;
		public static var Offers       : *;
		public static var Pages        : *;
		public static var Photos       : *;
		public static var Ques         : *;
		public static var SMS          : *;
		public static var User         : *;
		public static var UserField    : *;
		public static var UserNameCase : *;
		public static var UserSett     : *;
		public static var Variables    : *;
		public static var Wall         : *;

		/**
		 * Загрузить библиотеку.
		 *
		 * @param onLoad функция без параметров, вызываемая после загрузки.
		 *
		 * @param url адрес swf файла.
		 */
		public static function load(onLoad: Function, url: String): void
		{
			var loader:Loader = new Loader();
			var onComplete: Function = function (e: Event): void
			{
				var getDef: Function =  e.target.applicationDomain.getDefinition;
				MD5  = getDef('utils.MD5');
				JSON = getDef('com.serialization.json.JSON');

				APIVK   = getDef('com.vk.api.APIVK');
				VKQueue = getDef('com.vk.api.VKQueue');

				Audio        = getDef('com.vk.api.lib.Audio');
				Geo          = getDef('com.vk.api.lib.Geo');
				HighScores   = getDef('com.vk.api.lib.HighScores');
				Language     = getDef('com.vk.api.lib.Language');
				Messages     = getDef('com.vk.api.lib.Messages');
				Misc         = getDef('com.vk.api.lib.Misc');
				Offers       = getDef('com.vk.api.lib.Offers');
				Pages        = getDef('com.vk.api.lib.Pages');
				Photos       = getDef('com.vk.api.lib.Photos');
				Ques         = getDef('com.vk.api.lib.Ques');
				SMS          = getDef('com.vk.api.lib.SMS');
				User         = getDef('com.vk.api.lib.User');
				UserField    = getDef('com.vk.api.lib.UserField');
				UserNameCase = getDef('com.vk.api.lib.UserNameCase');
				UserSett     = getDef('com.vk.api.lib.UserSett');
				Variables    = getDef('com.vk.api.lib.Variables');
				Wall         = getDef('com.vk.api.lib.Wall');

				onLoad();
				e.target.removeEventListener(Event.COMPLETE, onComplete);
			}
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest(url),
			            new LoaderContext(true, new ApplicationDomain())
			            );
		}
	}
}