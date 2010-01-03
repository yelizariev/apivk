// -*- coding: utf-8 -*-

// Copyright (c) 2009-2010 The apivk.googlecode.com project Authors.
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
			return APIVK.req('getServerTime');
		}

		/**
		 * Возвращает список таргетированных рекламных объявлений для
		 * текущего пользователя.
		 *
		 * @param count количество возвращаемых рекламных объявлений
		 * (максимум 20).
		 *
		 * @param type тип рекламных объявлений. 1 – только
		 * таргетированные объявления, 2 – только прямые объявления
		 * приложений, 3 – все объявления. По умолчанию равен 3.
		 *
		 * @param apps_ids список id приложений для выборки из прямых
		 * объявлений. Этот параметр игнорируется в том случае, если
		 * параметр type равен 1.
		 *
		 * @param min_price минимальная стоимость перехода по рекламной
		 * ссылке в сотых долях голоса. Применяется только при выборке
		 * из прямых объявлений. По умолчанию равен 0.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getAds
		 */
		public static function getAds(
		                              count: String = '1',
		                              type: String = null,
		                              apps_ids: Array = null,
		                              min_price: String = null
		                              ): URLRequest
		{
			APIVK.addPar('count', count);
			if (type)
				APIVK.addPar('type', type);
			if (apps_ids)
				APIVK.addParArray('apps_ids', apps_ids);
			if (min_price)
				APIVK.addPar('min_price', min_price);
			return APIVK.req('getAds');
		}

		/**
		 * Устанавливает название приложения, которое выводится в левом меню.
		 *
		 * <p> Перед использованием необходимо, чтобы пользователь
		 * добавил приложение в левое меню со страницы приложения,
		 * списка приложений или настроек. </p>
		 *
		 * @param name короткое название приложения для левого меню, до
		 * 17 символов в формате UTF.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=setNameInMenu
		 */
		public static function setNameInMenu(
		                                     name: String
		                                     ): URLRequest
		{
			APIVK.addPar('name', name);
			return APIVK.req('setNameInMenu');
		}

		/**
		 * Универсальный метод, который позволяет запускать
		 * последовательность других методов, сохраняя и фильтруя
		 * промежуточные результаты.
		 *
		 * @param code код алгоритма в VKScript - формате, похожем на
		 * JavaSсript или ActionScript (предполагается совместимость с
		 * ECMAScript). Алгоритм должен завершаться командой return
		 * %выражение%. Операторы должны быть разделены точкой с
		 * запятой.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=execute
		 */
		public static function execute(
		                               code: String
		                               ): URLRequest
		{
			APIVK.addPar('code', code);
			return APIVK.req('execute');
		}
	}
}
