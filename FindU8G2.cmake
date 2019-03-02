set(U8G2_MAIN_HEADER u8g2.h)

file(GLOB_RECURSE U8G2_SRC_PATH ${U8G2_MAIN_HEADER})
if(U8G2_SRC_PATH)
	get_filename_component(U8G2_INCLUDE_DIR ${U8G2_SRC_PATH} DIRECTORY)
elseif(U8G2_FIND_REQUIRED)
	message(FATAL_ERROR "Could not find U8G2")
endif()

set(U8G2_INCLUDE_DIRS
	${U8G2_INCLUDE_DIR}
	)

file(GLOB U8G2_SOURCES ${U8G2_INCLUDE_DIR}/*.c*)

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(U8G2 DEFAULT_MSG U8G2_INCLUDE_DIRS U8G2_SOURCES)

