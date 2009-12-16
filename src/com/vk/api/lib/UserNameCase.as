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
	 * Описание падежей для имени и фамилии, используемые в методе
	 * <code>User.getProfiles</code>
	 *
	 * @see User#getProfiles
	 */
	public class UserNameCase
	{

		/**
		 * именительный
		 */
		public static const NOM: String = 'nom';

		/**
		 * родительный
		 */
		public static const GEN: String = 'gen';

		/**
		 * дательный
		 */
		public static const DAT: String = 'dat';

		/**
		 * винительный
		 */
		public static const ACC: String = 'acc';

		/**
		 * творительный
		 */
		public static const INS: String = 'ins';

		/**
		 * предложный
		 */
		public static const ABL: String = 'abl';
	}
}
