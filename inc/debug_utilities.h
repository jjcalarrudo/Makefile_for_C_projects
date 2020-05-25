#ifndef __DEBUG_UTILITIES 
#define __DEBUG_UTILITIES


#ifdef DEBUG
// Add debug utility functions below
//
// #includes below this point
#include <stdio.h>

// # define dbg functions
#define DBGONLY(x) x
#define DBGPRINTF(fmt, ...) \
        do { if (DEBUG) fprintf(stderr, "%s:%d:%s(): " fmt, __FILE__, \
                __LINE__, __func__, __VA_ARGS__); } while (0)

#else
// noop function definitions

#define DBGONLY(x)
#define DBGPRINTF(...)

#endif


#endif // __DEBUG_UTILITIES
