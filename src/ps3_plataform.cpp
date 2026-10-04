#include "ps3_platform.h"

#include <sysutil/sysutil.h>
#include <sys/process.h>
#include <stdlib.h>

namespace PS3Platform
{
    bool Init()
    {
        return true;
    }

    void Shutdown()
    {
    }

    void* Alloc(uint32_t size)
    {
        return malloc(size);
    }

    void Free(void* ptr)
    {
        free(ptr);
    }

    void VSync()
    {
    }
}
