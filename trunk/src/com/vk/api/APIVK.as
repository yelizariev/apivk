// -*- coding: utf-8 -*-

// Copyright (c) 2009 The apivk.googlecode.com project Authors.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

// url in repo: $URL$
// Author   of current version: $Author$
// Date     of current version: $Date$
// Revision of current version: $Rev$

package com.vk.api
{
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import com.hurlant.crypto.hash.MD5;
	import com.hurlant.crypto.util.Hex;

	/**
	 * Главный класс библиотеки apivk.
	 * <p>Единственный обязательный класс в библиотеке.</p>
	 * <p>Используется для инициализации, генерации сигнатуры, 
	 * создания объектов <code>URLRequest</code>.</p>
	 *
	 * @see http://apivk.googlecode.com
	 * @see http://vkontakte.ru/pages.php?id=2369282
	 * @see http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/net/URLRequest.html
	 */
	public class APIVK
	{
		private static const API_VERSION: String = '2.0';

		/**
		 * Определяет формат возвращаемых данных.
		 *
		 * @default 'XML'
		 * @see #XML
		 * @see #JSON
		 */
		public static var format: String = XML;
		public static const XML : String = 'XML';
		public static const JSON: String = 'JSON';

		/**
		 * Определяет тип HTTP запроса.
		 *
		 * @default 'POST';
		 * @see #POST
		 * @see #GET
		 */
		public static var httpMethod: String = POST;
		public static const POST: String = 'POST';
		public static const GET : String = 'GET';

		private static var _viewerID  : String;
		private static var _apiID     : String;
		private static var _secret    : String;
		private static var _isTestMode: Boolean;

		private static var _params: Array = [];

		/**
		 * Инициализация.
		 * <p> Необходимо сделать вызов данной прежде, чем обращаться
		 * каким-либо другим методам библиотеки apivk.</p>
		 *
		 * <p>Если <code>isTestMode</code> задаётся значение <code>false</code>,
		 * то в качестве <code>viewer_id</code> нужно задавать id владельца
		 * приложения <code>api_id</code>.</p>
		 *
		 * @param viewer_id id текущего пользователя, переданный SWF
		 * посредством flashvars при инициализации.
		 *
		 * @param api_id идентификатор приложения, присваивается при создании.
		 *
		 * @param secret секрет приложения.
		 *
		 * @param isTestMode если этот параметр равен true, разрешает
		 * тестовые запросы к данным приложения. При этом аутентификация
		 * не проводится и считается, что текущий пользователь – это автор
		 * приложения. Это позволяет тестировать приложение без загрузки
		 * его на сайт. По умолчанию <code>false</code>.
		 */
		public static function init(
		                            viewer_id : String,
		                            api_id    : String,
		                            secret    : String,
		                            isTestMode: Boolean = false
		                            ): void
		{
			_viewerID   = viewer_id;
			_apiID      = api_id;
			_secret     = secret;
			_isTestMode = isTestMode;
		}

		/**
		 * Задать значение метода API.
		 */
		public static function set method (value: String): void
		{
			addVar('method', value);
		}

		/**
		 * Добавить параметр в список параметров запроса.
		 */
		public static function addVar(name: String, value: String): void{
			_params.push(new Parameter(name, value));
		}
		/**
		 * Добавить параметр в список параметров запроса.
		 * <p>Используется для случаев, когда value может
		 * содержать "плохие" символы.</p><p><code>TODO</code></p>
		 */
		public static function addVarSafe(name: String, value: String){
			//TODO
			addVar(name, value);
		}

		/**
		 * Cоздать объект XMLRequest.
		 * <p>Использует данные полученные через <code>APIVK.method</code>,
		 * <code>addVar</code>, <code>addVarSafe</code>. После использования
		 * эти данные удаляются.
		 *
		 * @return HTTP запрос, в соответствии с предыдущими обращениями к классу.
		 *
		 * @see #method
		 * @see #addVar()
		 * @see #addVarSafe()
		 */
		public static function req(): URLRequest{
			_params.push(new Parameter('api_id', _apiID          ));
			_params.push(new Parameter('v'     , API_VERSION     ));
			_params.push(new Parameter('sig'   , getSig(_params) ));
			if (format == JSON)
				_params.push(new Parameter('format', JSON));
			if (_isTestMode)
				_params.push(new Parameter('test_mode', '1'));

			var req: URLRequest = new URLRequest();
			req.method = httpMethod;

			var vars: URLVariables = new URLVariables();
			for each (var p: Parameter in _params){
				vars[p.name] = p.value;
			}
p			req.data = vars;
			_params.slice(0);// clear array;
			return req;
		}
		private function getSig(parameters: Array): String
		{
			_params.sortOn('name');
			var str: String = _viewerID + _params.join('') + _secret;
			var bytes:ByteArray = new ByteArray();
			bytes.writeUTFBytes(str);
			bytes = new MD5().hash(bytes);
			return Hex.fromArray(bytes);
		}
	}
}
class Parameter
{
	public var name : String;
	public var value: String;
	public function Parameter(name: String, value: String)
	{
		this.name  = name;
		this.value = value;
	}
	public function toString(): String
	{
		return name + "=" + value;
	}
}
