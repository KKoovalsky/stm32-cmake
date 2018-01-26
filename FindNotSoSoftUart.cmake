FIND_PATH(NSSU_PARENT_DIR NotSoSoftUart
	HINTS ${CMAKE_SOURCE_DIR}/drv
	CMAKE_FIND_ROOT_PATH_BOTH
)

SET(NSSU_PATH ${NSSU_PARENT_DIR}/NotSoSoftUart)

FILE(GLOB NSSU_SOURCES ${NSSU_PATH}/*.c)
SET(NSSU_INC_DIR ${NSSU_PATH})

IF(UNIT_TEST_LOCAL)
	FILE(GLOB NSSU_TEST_SOURCES ${NSSU_PATH}/tests/*.c)
	SET(NSSU_TEST_INC_DIR ${NSSU_PATH}/tests)
ENDIF()

SET(NotSoSoftUart_INCLUDE_DIRS ${NSSU_INC_DIR} ${NSSU_TEST_INC_DIR})
SET(NotSoSoftUart_SOURCES ${NSSU_SOURCES} ${NSSU_TEST_SOURCES})

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(NotSoSoftUart DEFAULT_MSG NotSoSoftUart_INCLUDE_DIRS NotSoSoftUart_SOURCES)

