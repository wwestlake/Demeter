
enable_testing()

#add_executable(tests tcpip_test.cpp)
#target_link_libraries(tests tcpip ${Boost_LIBRARIES} tcpip pthread)
#target_include_directories(tests PRIVATE ${BOOST_INCLUDE_DIRS} ../tcpip)
set(UNIT_TEST tests)
#add_test(NAME test1 COMMAND ${UNIT_TEST})
#add_test(NAME test2 COMMAND ${UNIT_TEST})

set(TARGET_LIBS core)
set(TARGET_INCS ../core)


#I like to keep test files in a separate source directory called test
file(GLOB TEST_SRCS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)
#Run through each source
foreach(testSrc ${TEST_SRCS})
        #Extract the filename without an extension (NAME_WE)
        get_filename_component(testName ${testSrc} NAME_WE)
        #Add compile target
        add_executable(${testName} ${testSrc})
        target_include_directories(${testName} PUBLIC ${TARGET_INCS})
        #link to Boost libraries AND your targets and dependencies
        target_link_libraries(${testName} ${Boost_LIBRARIES} ${TARGET_LIBS})
        #I like to move testing binaries into a testBin directory
        set_target_properties(${testName} PROPERTIES
            RUNTIME_OUTPUT_DIRECTORY  ${CMAKE_CURRENT_BINARY_DIR})
        message(${CMAKE_CURRENT_BINARY_DIR})
        #Finally add it to test execution -
        #Notice the WORKING_DIRECTORY and COMMAND
        add_test(NAME ${testName}
                 WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                 COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${testName} )
             

endforeach(testSrc)


