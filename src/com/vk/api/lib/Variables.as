// -*- coding: utf-8 -*-

// Copyright (c) 2009 The apivk.googlecode.com project Authors.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

// url in repo: $URL$
// Author   of current version: $Author$
// Date     of current version: $Date$
// Revision of current version: $Rev$

package com.vk.api.lib
{
	import com.vk.api.APIVK;
	import flash.net.URLRequest;

	/**
	 * Хранение данных на серверах Вконтакте.
	 * <p></p>
	 * <table class="innertable">
	 * <tr>
	 *  <th>Номера</th><th>Постоянные</th>
	 *  <th>api_id</th><th>user_id</th><th>session</th>
	 *  <th>Зарезерв.</th>
	 *  <th>Описание</th>
	 * </tr>
	 * <tr>
	 *  <td>0</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>unixtime</td>
	 * </tr>
	 * <tr>
	 *  <td>1-14</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>-</td>
	 * </tr>
	 * <tr>
	 *  <td>16</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>highscores count</td>
	 * </tr>
	 * <tr>
	 *  <td>17</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>max_scores</td>
	 * </tr>
	 * <tr>
	 *  <td>18-31</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>-</td>
	 *  <td>application variables</td>
	 * </tr>
	 * <tr>
	 *  <td>30-(32+max_scores-1)</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>highscore records</td>
	 * </tr>
	 * <tr>
	 *  <td>(32+max_scores-1)-1023</td><td>Да</td>
	 *  <td>Да</td><td>-</td><td>-</td>
	 *  <td>-</td>
	 *  <td>application variables</td>
	 * </tr>
	 *
	 *
	 * <tr>
	 *  <td>1024-1039</td><td>Да</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>-</td>
	 * </tr>
	 * <tr>
	 *  <td>1040-1279</td><td>Да</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>-</td>
	 *  <td>user private vars</td>
	 * </tr>
	 * <tr>
	 *  <td>1280-1295</td><td>Да</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>Да</td>
	 *  <td>-</td>
	 * </tr>
	 * <tr>
	 *  <td>1296-1503</td><td>Да</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>-</td>
	 *  <td>user public vars (other users: read only)</td>
	 * </tr>
	 * <tr>
	 *  <td>1503-1535</td><td>Да</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>-</td>
	 *  <td>user public vars (other users: read-write)</td>
	 * </tr>
	 * <tr>
	 *  <td>1535-1567</td><td>-</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>-</td>
	 *  <td>user public vars (other users: read-write)</td>
	 * </tr>
	 * <tr>
	 *  <td>1568-1791</td><td>-</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>-</td>
	 *  <td>user public vars (other users: read only)</td>
	 * </tr>
	 * <tr>
	 *  <td>1792-2047</td><td>-</td>
	 *  <td>Да</td><td>Да</td><td>-</td>
	 *  <td>-</td>
	 *  <td>user private vars</td>
	 * </tr>
	 *
	 *
	 * <tr>
	 *  <td>2048</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>current session's id (read only)</td>
	 * </tr>
	 * <tr>
	 *  <td>2049</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>current session's name</td>
	 * </tr>
	 * <tr>
	 *  <td>2050-2063</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>-</td>
	 * </tr>
	 * <tr>
	 *  <td>2064</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>messages count</td>
	 * </tr>
	 * <tr>
	 *  <td>2065-2079</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>-</td>
	 *  <td>session vars</td>
	 * </tr>
	 * <tr>
	 *  <td>2080-2207</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>message query</td>
	 * </tr>
	 * <tr>
	 *  <td>2208-3071</td><td>-</td>
	 *  <td>Да</td><td>-</td><td>Да</td>
	 *  <td>-</td>
	 *  <td>session vars</td>
	 * </tr>
	 *
	 *
	 * <tr>
	 *  <td>3072</td><td>-</td>
	 *  <td>Да</td><td>Да</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>read messages count</td>
	 * </tr>
	 * <tr>
	 *  <td>3073-4095</td><td>-</td>
	 *  <td>Да</td><td>Да</td><td>Да</td>
	 *  <td>Да</td>
	 *  <td>instance vars</td>
	 * </tr>
	 * </table>
	 * <p>В постоянных переменных может храниться до 255 байтов.
	 * Во временных переменнах &#x2014; до 4095 байтов</p>
	 */
	public class Variables
	{
		/**
		 * id пользователя.
		 * <p>Используется в зависимости от номера переменной (см. Таблицу)</p>
		 * <p>Чтобы очистить переменную нужно задать ее значение равной
		 * пустой строке <code>""</code>. В этом случае параметр user_id
		 * передаваться не будет, но значение будет считаться равным id
		 * текущего пользователя </p>
		 */
		public static var user_id: String = "";
		/**
		 * Номер сессии.
		 * <p>Определяет c какой группой переменных работаем.</p>
		 */
		public static var session: String = "0";
		/**
		 * Получить значение переменной.
		 *
		 * @param key номер переменной.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getVariable
		 */
		public static function getVariable(
		                        key: uint
		                        ): URLRequest
		{
			APIVK.method = 'getVariable';
			APIVK.addVar('key', key.toString());
			checkUserIDGet(key);
			checkSession(key);
			return APIVK.req();
		}

		/**
		 * Получить значение нескольких переменных.
		 * 
		 *
		 * @param key номер первой переменной.
		 *
		 * @param count Значение от 1 до 32, количество переменных.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getVariables
		 */
		public static function getVariables(
		                                    key: uint,
		                                    count: uint
		                        ): URLRequest
		{
			APIVK.method = 'getVariables';
			APIVK.addVar('key',   key.toString()   );
			APIVK.addVar('count', count.toString() );
			checkUserIDGet(key);
			checkSession(key);
			return APIVK.req();
		}

		/**
		 * Записать в переменную.
		 *
		 * @param key номер переменной.
		 *
		 * @param value значение переменной.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=putVariable
		 */
		public static function putVariable(
		                        key: uint,
		                        value: String
		                        ): URLRequest
		{
			APIVK.method = 'putVariable';
			APIVK.addVar('key',   key.toString() );
			APIVK.addVar('value', value          );
			checkUserIDPut(key);
			checkSession(key);
			return APIVK.req();
		}
		private static function checkUserIDGet(key: uint): void{
			if (user_id != "")
				return;
			if ((1280 <= key) && (key <= 1791))
				APIVK.addVar('user_id', user_id);
		}
		private static function checkUserIDPut(key: uint): void{
			if (user_id != "")
				return;
			if ((1504 <= key) && (key <= 1567))
				APIVK.addVar('user_id', user_id);
		}
		private static function checkSession(key: uint): void{
			if (2048 <= key)
				APIVK.addVar('session', session);
		}
	}
}
