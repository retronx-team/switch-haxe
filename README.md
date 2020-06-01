# Switch Haxe sample project

This is a sample project for running Haxe on the Nintendo Switch using devkitA64 and libnx.

Right now the libnx binding only contains what's needed to run the Hello World sample. It's very easy to add more, PRs are welcome :)

Special thanks to Aurel300 for his guidance on how to use ammer.

## Dependencies

* devkitA64 and libnx
* Haxe (duh)
* [This fork](https://github.com/retronx-team/switch-hxcpp) of hxcpp (install using `haxelib git`), containing the modified toolchain
* [This fork](https://github.com/retronx-team/switch-ammer) of ammer (install using `haxelib git`), used to bind external C libraries
* The [Haxe libnx binding](https://github.com/retronx-team/switch-haxe-libnx) (already included in the sample as a [subrepo](https://github.com/ingydotnet/git-subrepo))

## How to use

1. Haxe code goes in `haxe_src`
2. Run `build_haxe.sh` to compile the Haxe code
    * Run `clean_haxe.sh` to clean that
3. Run `make` to link the output of that in an NRO
4. You need to run BOTH steps (compilation + linking) every time you change the Haxe code
5. You can change the homebrew name, icon, romfs... by editing the `Makefile` like any other homebrew

## How does it work

1. `build_haxe.sh`:
    1. converts the Haxe code into C++ classes
    2. *compiles* the code into a `.a` file (`libMain.a`)
        * this code alone is not executable, it's just an archive containing all the Haxe classes
3. the standard homebrew `Makefile`:
    1. compiles `wrapper.c`, which contains a `main` function booting the Haxe main class
    2. *links* `libMain.a` and `wrapper.o` into the final NRO

So Haxe is responsible for the compilation step, and the homebrew `Makefile` is responsible for the linking step. It's important to know if you want to add external libraries.

## How to use external C/C++ libraries

You need to add the *includes directory* to the *hxcpp path*, and the *library* to the *`Makefile`*.

1. By editing either directly the toolchain XML file or by adding a custom `Build.xml` to your project, add the includes directory to the hxcpp path
2. Use ammer to bind your C functions to an Haxe class
    * If the header name is not the same as the library name (for instance the header for libnx is `switch.h`, not `nx.h`), edit `build_haxe.sh` and add an ammer define like the one libnx has (`ammer.lib.xxx.headers`)
4. In the homebrew `Makefile`, add the library to the `LIBS` variable as you would for a regular homebrew
    * No need to add it to the includes path, as `wrapper.c` is the only file left to compile at that point
    * In this file, `$(HAXE_LIBMAIN)` corresponds to your Haxe code (`libMain.a`)
