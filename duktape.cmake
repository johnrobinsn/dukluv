set(DUKTAPEDIR ${CMAKE_CURRENT_LIST_DIR}/lib/duktape)
set(DUKTAPE_MODULE_DIR ${CMAKE_CURRENT_LIST_DIR}/lib/duktape/extras/module-duktape/)
set(DUKTAPE_V1_COMPAT_DIR ${CMAKE_CURRENT_LIST_DIR}/lib/duktape/extras/duk-v1-compat/)
set(DUKTAPE_PRINT_DIR ${CMAKE_CURRENT_LIST_DIR}/lib/duktape/extras/print-alert/)

include_directories(
  ${DUKTAPEDIR}/src
  ${DUKTAPE_MODULE_DIR}
  ${DUKTAPE_V1_COMPAT_DIR}
  ${DUKTAPE_PRINT_DIR}
)

add_library(duktape STATIC ${DUKTAPEDIR}/src/duktape.c ${DUKTAPE_MODULE_DIR}/duk_module_duktape.c ${DUKTAPE_V1_COMPAT_DIR}/duk_v1_compat.c ${DUKTAPE_PRINT_DIR}/duk_print_alert.c)

if("${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
  target_link_libraries(duktape
    m dl rt
  )
endif()
