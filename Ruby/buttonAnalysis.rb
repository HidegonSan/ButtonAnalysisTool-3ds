def buttonAnalysis(code)

	code = code[0, 3] + "0" + code[4, 8]

	if code[4].to_i(16) < 4
		code = code[0, 4] + "0" + code[5, 8]
	end

	baseCode = code.to_i(16)
	ret = []

	codes = [
		0x80000000,  # CD
		0x40000000,  # CU
		0x20000000,  # CL
		0x10000000,  # CR
		0x8000000,  # SD
		0x4000000,  # SU
		0x2000000,  # SL
		0x1000000,  # SR
		0x100000,  # Touch
		0x8000,  # ZR
		0x4000,  # ZL
		0x800,  # Y
		0x400,  # X
		0x200,  # L
		0x100,  # R
		0x80,  # ↓
		0x40,  # ↑
		0x20,  # ←
		0x10,  # →
		0x8,  # Start
		0x4,  # Select
		0x2,  # B
		0x1,  # A
	]

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
	]

	for i in 0..22 do
	     codeNumber = codes[i]
		if baseCode >= codeNumber
			baseCode -= codeNumber
			ret.push(buttons[i])
		end
	end

	return ret.reverse.join(" + ")
end

# (C) 2021 Hidegon
