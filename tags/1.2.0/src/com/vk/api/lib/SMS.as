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
	 * Методы, связанные с отправкой и приемом SMS
	 */
	public class SMS
	{
		/**
		 * Устанавливает префикс для обеспечения уникальности приложения-получателя SMS при отправке SMS пользователем приложению на номер ВКонтакте: 
		 *
		 * @param prefix 3-16 символов латинского алфавита в формате UTF-8.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=setSMSPrefix
		 */
		public static function setSMSPrefix(
		                                    prefix: String
		                                    ): URLRequest
		{
			APIVK.addPar('prefix', prefix);
			return APIVK.req('setSMSPrefix');
		}

		/**
		 * Возвращает префикс SMS, установленный до этого методом setSMSPrefix.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getSMSPrefix
		 */
		public static function getSMSPrefix(): URLRequest
		{
			return APIVK.req('getSMSPrefix');
		}
	}
}
