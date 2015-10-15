#!/bin/bash

 case "$1" in
   2) echo "Error use in a 'builtin' Shell";;
   126) echo "Command not executable (without permits) to touch";;
   127) echo "Command not found (command not found)";;
   128) echo "The parameter to exit is not a decimal";;
   130) echo "Program interrupted with Ctrl + C";;
   255) echo "The parameter to (exit) is not between 0 and 255";;
   *) echo "Error in the command: $1";;
 esac
