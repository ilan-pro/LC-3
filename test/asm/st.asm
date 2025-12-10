	.ORIG x3000
	AND R0, R0, 0
	ADD R0, R0, 8
	ST R0, test ;devrait remplacer le 5 par le 8 (valeur contenu dans R0)
test: 	.FILL 5
	.END
