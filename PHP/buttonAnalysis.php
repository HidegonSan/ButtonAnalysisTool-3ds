<?php

function buttonAnalysis($code) {
	$code = substr($code, 0, 3) . "0" . substr($code, 4);

	if (hexdec(substr($code, 4, 1)) < 4) {
		$code = substr($code, 0, 4) . "0" . substr($code, 5, 8);
	}

	$baseCode = hexdec($code);
	$ret = [];

	$codes = [
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

	$buttons = [
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

	for ($i=0; $i<23; $i++) {
		$codeNumber = $codes[$i];
		if ($baseCode >= $codeNumber) {
			$baseCode -= $codeNumber;
			array_push($ret, $buttons[$i]);
		}
	}

	return join(" + ", array_reverse($ret));
}

// (C) 2021 Hidegon
?>
