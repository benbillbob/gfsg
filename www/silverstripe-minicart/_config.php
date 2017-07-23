<?php

define('MODULE_MINICART_DIR', basename(dirname(__FILE__)));

ShortcodeParser::get()->register('minicart_item', array('MiniCartPageExtension', 'MiniCartItemShortCode'));

