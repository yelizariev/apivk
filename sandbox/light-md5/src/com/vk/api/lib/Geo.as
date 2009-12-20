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
	 * информация о географических объектах.
	 */
	public class Geo
	{
		/**
		 * информация о городе
		 *
		 * @param cids список ID городов
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getCities
		 */
		public static function getCities(
		                                 cids: Array
		                                 ): URLRequest
		{
			APIVK.method = 'getCities';
			APIVK.addParArray('cids', cids);
			return APIVK.req();
		}

		/**
		 * информация о стране
		 *
		 * @param cids список ID стран
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getCountries
		 */
		public static function getCountries(
		                                    cids: Array
		                                    ): URLRequest
		{
			APIVK.method = 'getCountries';
			APIVK.addParArray('cids', cids);
			return APIVK.req();
		}
	}
}
