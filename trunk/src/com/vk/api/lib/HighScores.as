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
	 * Таблица рекордов.
	 * <p>Для реализации таблицы рекордов задействованы глобальные переменные
	 * 16,17 и 32...32+max_scores-1</p>
	 * <ul>
	 *  <li>Переменная 16 хранит текущее количество записей
	 *  в таблице рекордов.</li>
	 *  <li>Переменная 17 - максимальное количество записей в
	 *  таблице рекордов (max_scores).</li>
	 *  <li>Переменные, начиная с 32-й, хранят саму таблицу – каждая
	 *  переменная содержит три поля score, user_id и user_name,
	 *  разделенные символом с кодом 31.<li>
	 * </ul>
	 */
	public class HighScores
	{
		/**
		 * Добавить результат текущего пользователя.
		 * При этом, если таблица уже заполнена, то наименьший из имеющихся
		 * будет вытеснен, если он меньше добавляемого.
		 *
		 * @param score рекорд пользователя для записи.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=setUserScore
		 */
		public static function setUserScore(
		                                    score: String,
		                                    ): URLRequest
		{
			APIVK.method = 'setUserScore';
			APIVK.addVar('score', score);
			return APIVK.req();
		}

		/**
		 * Получить текущую таблицу рекордов.
		 *
		 * @see http://vkontakte.ru/pages.php?o=-1&p=getHighScores
		 */
		public static function getHighScores(): URLRequest
		{
			APIVK.method = 'getHighScores';
			return APIVK.req();
		}
	}
}
