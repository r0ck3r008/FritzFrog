rule FritzFrog {
	meta:
		description = "Detect FritzFrog malware"
		author = "Naman Arora"
		date = "2021-04-27"
		hash = "001eb377f0452060012124cb214f658754c7488ccb82e23ec56b2f45a636c859"
	strings:
		$debug = "/home/nignog/development/" nocase ascii
		$elf = { 7F 45 4C 46 }
	condition:
		$elf at 0 and filesize < 10MB and $debug
}
