#include <switch.h>

#include <cstdio>

#include <hxcpp.h>

extern "C" void __hxcpp_main();
extern "C" void __hxcpp_lib_main();

extern int _hxcpp_argc;
extern char **_hxcpp_argv;

int main(int argc,char **argv)
{
    _hxcpp_argc = argc;
    _hxcpp_argv = argv;

    HX_TOP_OF_STACK
    hx::Boot();

    try
    {
        __boot_all();
        __hxcpp_main();
    }
    catch (Dynamic e)
    {
        __hx_dump_stack();
        printf("Error : %s\n",e==null() ? "null" : e->toString().__CStr());
        return -1;
    }

    return 0;
}
