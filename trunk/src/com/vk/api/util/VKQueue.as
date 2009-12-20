// -*- coding: utf-8 -*-

// Copyright (c) 2009 The apivk.googlecode.com project Authors.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

// url in repo: $URL$
// Author   of current version: $Author$
// Date     of current version: $Date$
// Revision of current version: $Rev$

package com.vk.api.util
{
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;

	/**
	 * Класс организует очередь для запросов URLRequest и проверяет
	 * ответ на верхний теги error
	 */
	public class VKQueue
	{
		private static var _queue: Array = [];
		private static var _timer: Timer;

		/**
		 * @param delay интервал между запросами в миллисекундах
		 */
		public static function init(delay: Number): void
		{
			_timer = new Timer(delay);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		/**
		 * Добавить запрос в очередь.
		 *
		 * @param req
		 *
		 * @param onSuccess вызывается после получения ответа в случае,
		 * если нет тега error. В функцию передаётся полученные данные:
		 * <code>onSuccess(data: XML)</code>
		 *
		 * @param onError вызывается в случае, если получен ответ с
		 * тегом error. В функцию передаётся код ошибки, название
		 * ошибки, параметры запросы: <code>onError(errorCode: String,
		 * errorMsg: String, reqParams: XML)</code>
		 *
		 */
		public static function addReq(
		                              req: URLRequest,
		                              onSuccess: Function,
		                              onError: Function
		                              ):void
		{
			if (_timer.running)
				_queue.push(new Record(req, onSuccess, onError));
			else{
				makeReq(req, onSuccess, onError);
				_timer.start();
			}
		}

		private static function onTimer(e: TimerEvent): void{
			if (_queue.length == 0){
				_timer.stop();
				return;
			}
			var r: Record = _queue.shift();
			makeReq(r.req, r.onSuccess, r.onError);
		}

		private static function makeReq(
		                                req: URLRequest,
		                                onSuccess: Function,
		                                onError: Function
		                                ):void
		{
			var onComplete: Function =
				function (e: Event): void
				{
					onReceive(XML(e.target.data), onSuccess, onError);
					e.target.removeEventListener(Event.COMPLETE, onComplete);
				}
			var loader: URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load(req);
		}

		private static function onReceive(
		                                  xml: XML,
		                                  onSuccess: Function,
		                                  onError: Function
		                                  ): void
		{
			if (xml.localName() == 'error')
				onError(
				        xml.error_code.toString(),
				        xml.error_msg.toString(),
				        XML(xml.request_params)
				        );
			else
				onSuccess(xml);
		}
	}
}
class Record
{
	import flash.net.URLRequest;

	public var req: URLRequest;
	public var onSuccess: Function;
	public var onError: Function;
	public function Record(
	                       req: URLRequest,
	                       onSuccess: Function,
	                       onError: Function
	                       )
	{
		this.req       = req;
		this.onSuccess = onSuccess;
		this.onError   = onError
			}
}
