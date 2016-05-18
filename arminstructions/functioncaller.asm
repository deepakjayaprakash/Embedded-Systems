	PRESERVE8
	THUMB
	AREA |.text|, CODE, READONLY

	EXPORT __main
	EXTERN func
__main
	BL func
	NOP
	END