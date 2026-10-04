#ifndef PS3_INPUT_H
#define PS3_INPUT_H

namespace PS3Input
{
    bool Init();
    void Update();
    bool IsPressed(int button);
    void Shutdown();
}

#endif