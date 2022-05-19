# Welcome to Demeter

*The Law of Demeter principle states that a module should not have the knowledge on the inner details of the objects it manipulates. In other words, a software component or an object should not have the knowledge of the internal working of other objects or components*

## Name

*The Law of Demeter principle states that a module should not have the knowledge on the inner details of the objects it manipulates. In other words, a software component or an object should not have the knowledge of the internal working of other objects or components*

-- Britannica, T. Editors of Encyclopaedia (2020, May 22). Demeter. Encyclopedia Britannica. https://www.britannica.com/topic/Demeter


*Rhea, in Greek religion, ancient goddess, probably pre-Hellenic in origin, who was worshipped sporadically throughout the Greek world. She was associated with fruitfulness and had affinities with Gaea (Earth) and the Great Mother of the Gods (also called Cybele). A daughter of Uranus (Heaven) and Gaea, Rhea was a Titan. She married her brother Cronus, who, warned that one of his children was fated to overthrow him, swallowed his children Hestia, Demeter, Hera, Hades, and Poseidon soon after they were born. Rhea concealed the birth of Zeus in a cave on Mount Dicte in Crete and gave Cronus a stone wrapped in swaddling clothes. This he swallowed in the belief that it was Zeus. Subsequently Cronus was vanquished by Zeus and was forced to disgorge the swallowed children.*

--Britannica, T. Editors of Encyclopaedia (2020, June 26). Rhea. Encyclopedia Britannica. https://www.britannica.com/topic/Rhea-Greek-goddess

## Concept

The idea behind demeter is to create a high-level language that targets various platforms.  The minumum desired platforms are:
- Windows
- Linux
- Web Assembly

As a high level language it will contain the following primary capabilities:

- Multi-Paradigm
    - Functional (with functions as first class citizens)
    - Object Oriented (with virual methods, inheritance, interfaces)
    - Procedural
    - Generics
    
- Built in math capabilities with various built in types
    - All of the normal math functions
    - Complex numbers
    - Vectors
    - Matrices
    - Geometric constructs (using vectors and matrices)

- Built in string parsing and formatting
- Built in file handling, with cross platforms conditions
- Memory management using scope and reference counting (no garbage collection)

## Compilation, optimization, and linking (Demeter)

The compiler is named Demeter after the greek godess of argriculture.  The build and package manager is call Rhea after her sister.

The compiler is built on Flex and Bison generating an Abstract Syntax Tree (AST).  The AST will be processed and optimized in various ways.  LLVM will be used for final compilation and linking to form platform specific executable or library code.

## Package Manager and Build System (Rhea)









