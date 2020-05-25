# Makefile and guidance for C/C++ projects

This project is designed to provide a guidance on how to setup simple C/C++ projects.  A Makefile template is included
that will create release and debug builds.  This Makefile template should be modified as needed.  It can also be used in
a sub Makefile template as well.

# Directory layout

A project directory will be layed out in the following manner as needed.

Directories:

* bin : Location of binaries needed by the project.
* include : Location for all project header files.  This is a required directory if header files are used in the project.
* lib : Location for all non system libraries that the project relies on.  This will store all .a and .so
* modules : This is the direcory where all sub projects will be stored.  Each sub project will be layed out using this guidance. 
* src : REQUIRED for all projects.  This is the location of all .c/.cpp/.cxx files for the project.

Files:

* Makefile : Used to build the project.
* README.md : This describes project purpose, dependencies, build commands, and usage for a project.

# Guidance

1. Take time to design the project.  Think about the following:
    * Project Inputs
    * Project Outputs
    * User interaction
    * System Interaction
2. Create a project design using UML or what ever design process you prefer.  Just create a design.
3. Any code that you continue to reuse should be broken out into a separate file.  If there are issues with the code
   it's a single place to fix.
4. Almost always a single return in a function.
5. If your function is greater than 100 lines.  Refactor the code if possible.  Use the design to help you.
6. Use return codes.
    * > 0 : Informational return code
    * 0 : Success
    * < 0 : Error code
