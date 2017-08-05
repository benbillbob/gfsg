tinyMCEPopup.requireLangPack();

var ShortcodeDialog = {
	init : function() {
		var f = document.forms[0];
		// get selected shortcode from dropdown box
		f.selectedShortcode.value = f.selectedShortcode.value;
	},

	insert : function() {
		// Insert the contents from the input into the document
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, document.forms[0].selectedShortcode.value);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(ShortcodeDialog.init, ShortcodeDialog);
