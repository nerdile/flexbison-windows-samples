cmake_minimum_required (VERSION 3.0)
include($ENV{SRCROOT}/master.cmake)
include_directories(.)

project(win-flex-bison-sample)


LIST(APPEND CMAKE_FIND_LIBRARY_SUFFIXES ".a")
FIND_LIBRARY(FL_LIBRARY NAMES libfl fl DOC "path to the fl library")

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

BISON_TARGET(CalcParser calc.y ${CMAKE_CURRENT_BINARY_DIR}/bison.cpp)
FLEX_TARGET(CalcScanner calc.lex ${CMAKE_CURRENT_BINARY_DIR}/lex.cpp)
ADD_FLEX_BISON_DEPENDENCY(CalcScanner CalcParser)

add_executable(win-flex-bison-sample
    main.cpp
    ${BISON_CalcParser_OUTPUTS}
    ${FLEX_CalcScanner_OUTPUTS}
)
target_link_libraries(win-flex-bison-sample
    ${FLEX_LIBRARIES}
)