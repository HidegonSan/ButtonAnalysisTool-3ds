#include <iostream>
#include <string>
#include <sstream>
#include <vector>


// Thanks: https://marycore.jp/prog/cpp/vector-join/
std::string join(const std::vector<std::string>& v, const char* delim = 0) {
	std::string s;
	if (!v.empty()) {
		s += v[0];
		for (decltype(v.size()) i = 1, c = v.size(); i < c; ++i) {
			if (delim) s += delim;
			s += v[i];
		}
	}
	return s;
}


std::string buttonAnalysis(std::string code) {
	code = code.substr(0, 3) + "0" + code.substr(4);

	if (std::stoi(code.substr(4, 1), nullptr, 16) < 4) {
		code = code.substr(0, 4) + "0" + code.substr(5);
	}

	double baseCode = std::stoi(code, nullptr, 16);
	std::vector<std::string> ret;

	double codes[] = {
		0x80000000,	// CD
		0x40000000,	// CU
		0x20000000,	// CL
		0x10000000,	// CR
		0x8000000,	// SD
		0x4000000,	// SU
		0x2000000,	// SL
		0x1000000,	// SR
		0x100000,	// Touch
		0x8000,		// ZR
		0x4000,		// ZL
		0x800,		// Y
		0x400,		// X
		0x200,		// L
		0x100,		// R
		0x80,		// ↓
		0x40,		// ↑
		0x20,		// ←
		0x10,		// →
		0x8,		// Start
		0x4,		// Select
		0x2,		// B
		0x1,		// A
	};

	std::string buttons[] = {
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
	};

	for (int i = 0; i < 23; i++) {
		if (baseCode >= codes[i]) {
			baseCode -= codes[i];
			ret.push_back(buttons[i]);
		}
	}

	std::reverse(ret.begin(), ret.end());
	return join(ret, " + ");
}

// (C) 2021 Hidegon
