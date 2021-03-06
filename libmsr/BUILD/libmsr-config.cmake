# Lauren Morita

# libmsr config
if (NOT libmsr_CONFIG_LOADED)
    set(libmsr_CONFIG_LOADED TRUE)

    #Install layout
    set(libmsr_INSTALL_PREFIX   /local/saeid/libmsr)
    set(libmsr_INCLUDE_DIR      ${libmsr_INSTALL_PREFIX}/include)
    set(libmsr_LIB_DIR          ${libmsr_INSTALL_PREFIX}/lib)

    #Includes needed to use libmsr
    set(libmsr_INCLUDE_PATH     ${libmsr_INCLUDE_DIR})
    set(libmsr_LIB_PATH         ${libmsr_LIB_DIR})

    #Library targets imported from file
    include(${libmsr_INSTALL_PREFIX}/share/cmake/libmsr/libmsr-libs.cmake)
endif()
