#ifndef PS3_PLATFORM_H
#define PS3_PLATFORM_H

#include <stdint.h>

namespace PS3Platform
{
    bool Init();
    void Shutdown();

    void* Alloc(uint32_t size);
    void Free(void* ptr);

    void VSync();
}

#endif