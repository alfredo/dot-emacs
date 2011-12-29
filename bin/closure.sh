#!/bin/bash
java -jar ~/bin/compiler.jar --warning_level VERBOSE --js $1 --js_output_file /dev/null
