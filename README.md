# Parser Sample

This is an example of using Flex/Bison to write a parser in C++ on Windows.

## Release 1
A first working example of writing a parser, using flex and bison from winflexbison.

### Requirements:
- CMake for building
- gnuwin32 flex and bison both installed into D:\gnu\bison, or update CMAKE_PREFIX_PATH in setenv.bat

### Issues:
- x64: no x64 build of libfl.a from gnuwin32 flex
- x86: does not link - libfl.a not suitable for /SAFESEH

### Next steps:
- Build libfl from scratch with our compiler and crt
