#include <stdio.h>

#include <sys/process.h>

#include "ps3_platform.h"
#include "ps3_graphics.h"
#include "ps3_input.h"

int main()
{
    if (!PS3Platform::Init())
        return 1;

    if (!PS3Graphics::Init())
        return 1;

    if (!PS3Input::Init())
        return 1;

    printf("Wind Waker PS3 test\n");

    PS3Input::Update();
    PS3Graphics::BeginFrame();
    PS3Graphics::EndFrame();

    PS3Input::Shutdown();
    PS3Graphics::Shutdown();
    PS3Platform::Shutdown();

    sysProcessExit(0);

    return 0;
}
