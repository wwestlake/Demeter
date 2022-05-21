#include <iostream>
#include <filesystem>
#include <fstream>
#include <sstream>
#include <string>

#include "../core/include/ast.h"

extern int eval(std::string line);

std::string readFileIntoString(const std::string& path) {
    std::ifstream input_file(path);
    if (!input_file.is_open()) {
        std::cerr << "Could not open the file - '"
             << path << "'" << std::endl;
        exit(EXIT_FAILURE);
    }
    return std::string((std::istreambuf_iterator<char>(input_file)), std::istreambuf_iterator<char>());
}

int main(int argc, char ** argv)
{
    std::cout << "Demeter 0.1.0" << std::endl;
    if (argc < 2) {
        std::cout << "Need input file: " << argv[0] << " [input-file]" << std::endl;
        return 1;
    }


    if (! std::filesystem::exists(argv[1]))
    {
        std::cout << "Input file: " << argv[1] << " not found" << std::endl << argv[0] << " [input-file]" << std::endl;
        return 1;
    }

    eval(readFileIntoString(argv[1]));
}
