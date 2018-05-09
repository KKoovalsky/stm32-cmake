CMAKE_MINIMUM_REQUIRED(VERSION 3.5)

IF(NOT TinyPrintf_DIR)
	MESSAGE(FATAL_ERROR "TinyPrintf_DIR not specified")
ENDIF()

SET(TinyPrintf_SOURCES ${TinyPrintf_DIR}/printf.c)
FILE(GLOB TinyPrintf_INCLUDE_DIR ${TinyPrintf_DIR})
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(TinyPrintf DEFAULT_MSG TinyPrintf_INCLUDE_DIR TinyPrintf_SOURCES)
