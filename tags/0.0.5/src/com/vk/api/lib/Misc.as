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
	 * Методы, не вошедшие в другие классы.
	 */
	public class Misc
	{
		/**
		 * unixtime сервера.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getServerTime
		 */
		public static function getServerTime(): URLRequest
		{
			APIVK.method = 'getServerTime';
			return APIVK.req();
		}

		/**
		 * Возвращает список таргетированных рекламных объявлений для
		 * текущего пользователя.
		 *
		 * @param count количество возвращаемых рекламных объявлений
		 * (максимум 10).
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getAds
		 */
		public static function getAds(
		                        count: String = '10'
		                        ): URLRequest
		{
			APIVK.method = 'getAds';
			APIVK.addPar('count', count);
			return APIVK.req();
		}
	}
}
