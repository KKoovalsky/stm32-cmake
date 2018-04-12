FUNCTION(FIND_FILE_RECURSIVE FILENAME FILEPATH)
	FILE(GLOB_RECURSE __FPATH */${FILENAME})
	LIST(LENGTH __FPATH __LISTLEN)
	IF(NOT __LISTLEN EQUAL 1)
		MESSAGE(FATAL_ERROR "Multiple files with same name or no such file: ${FILENAME}")
	ENDIF()
	SET(${FILEPATH} ${__FPATH} PARENT_SCOPE)
ENDFUNCTION()

# Exclude mocked files from build (from a list of source files) and include mock files instead.
# To replace a file one must provide in the directory MOCKS_DIR a file called the same but with "_mock" suffix
# after the filename and before extension. E.g. If You have a file lcd.c and you want to mock it then provide 
# a file called lcd_mock.c in MOCKS_DIR directory. SOURCE_FILES is the name of the variable containing the list
# of the source files. Remember that the mock file must implement the same functions like the mocked file.
FUNCTION(REPLACE_FILES_WITH_MOCKS MOCKS_DIR SOURCE_FILES)
	SET(SRCS ${${SOURCE_FILES}})
	FILE(GLOB MOCK_SRCS ${MOCKS_DIR}/*.c)
	FOREACH(FIL ${MOCK_SRCS})
		GET_FILENAME_COMPONENT(MOCK_FNAME ${FIL} NAME_WE)
		STRING(REPLACE "_mock" "" FNAME ${MOCK_FNAME})
		FIND_FILE_RECURSIVE(${FNAME}.c FPATH)
		LIST(REMOVE_ITEM SRCS ${FPATH})
		LIST(APPEND SRCS ${FIL})
	ENDFOREACH()
	SET(${SOURCE_FILES} ${SRCS} PARENT_SCOPE)
ENDFUNCTION()

# Remove files from a list of source files. Useful when some .c files are included within other .c files.
FUNCTION(REMOVE_FILES_FROM_SOURCES FILES_TO_REMOVE SOURCE_FILES)
	SET(SRCS ${${SOURCE_FILES}})
	FOREACH(FIL ${FILES_TO_REMOVE})
		FIND_FILE_RECURSIVE(${FIL} FPATH)
		LIST(REMOVE_ITEM SRCS ${FPATH})
	ENDFOREACH()
	SET(${SOURCE_FILES} ${SRCS} PARENT_SCOPE)
ENDFUNCTION()
