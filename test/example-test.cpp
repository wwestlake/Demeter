#define BOOST_TEST_MODULE "machine code test cases"
#include <boost/test/unit_test.hpp>

#include <string>

#include  "../core/include/core.hpp"


BOOST_AUTO_TEST_SUITE(suite2)

BOOST_AUTO_TEST_CASE( storeData )
{
    BOOST_CHECK_EQUAL(1,1);
}

BOOST_AUTO_TEST_SUITE_END()
