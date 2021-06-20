function  buttonAnalysis(code) {

	code = code.substring(0, 3) + "0" + code.substring(4, 8);

	if (parseInt(code.substring(4, 5), 16) < 4) {
		code = code.substring(0, 4) + "0" + code.substring(5, 8);
	}

	var baseCode = parseInt(code, 16);
	var ret = [];

	codes = [
		0x80000000,  // CD
		0x40000000,  // CU
		0x20000000,  // CL
		0x10000000,  // CR
		0x8000000,  // SD
		0x4000000,  // SU
		0x2000000,  // SL
		0x1000000,  // SR
		0x100000,  // Touch
		0x8000,  // ZR
		0x4000,  // ZL
		0x800,  // Y
		0x400,  // X
		0x200,  // L
		0x100,  // R
		0x80,  // ↓
		0x40,  // ↑
		0x20,  // ←
		0x10,  // →
		0x8,  // Start
		0x4,  // Select
		0x2,  // B
		0x1,  // A
	];

	buttons = [
		"CD",
		"CU",
		"CL",
		"CR",
		"SD",
		"SU",
		"SL",
		"SR",
		"Touch",
		"ZR",
		"ZL",
		"Y",
		"X",
		"L",
		"R",
		"↓",
		"↑",
		"←",
		"→",
		"Start",
		"Select",
		"B",
		"A",
	];

	for (var i = 0, len = buttons.length; i < len; ++i) {
		if (baseCode >= codes[i]) {
			baseCode -= codes[i];
			ret.push(buttons[i]);
		}
	}

	ret.reverse();

	return ret.join(' + ');

}

// (C) 2021 Hidegon
