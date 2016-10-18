#ifndef _FUCK_
#define _FUCK_


#define DLL_EXPORT

#if defined DLL_EXPORT
#define DECLDIR __declspec(dllexport)
#else
#define DECLDIR __declspec(dllimport)
#endif


DECLDIR int keyinfo();

#endif
