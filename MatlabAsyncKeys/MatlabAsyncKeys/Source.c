#include <windows.h>
#include "Header.h"
/*
asdjkahsgdhjabskdhaksdhaskdjbbasd
*/
DECLDIR int keyinfo()
{
	if (GetAsyncKeyState(VK_ESCAPE))
		return 27;
	else if (GetAsyncKeyState(VK_LEFT))
		return 37;
	else if (GetAsyncKeyState(VK_RIGHT))
		return 39;
	return 0;
}
