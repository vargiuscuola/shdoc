#!/bin/bash

source ../import.bash/import.bash
import:use "github.com/reconquest/test-runner.bash"

# @file Title of file script
# @brief Small description of the script.
# @show-internal

# @constant-header Terminal color codes
# @constant Color_Off Disable color
# @constant Black,Red,Green,Yellow,Blue,Purple,Cyan,Orange                                   Regular Colors
# @constant BBlack,BRed,BGreen,BYellow,BBlue,BPurple,BCyan,BWhite                            Bold Colors
# @constant UBlack,URed,UGreen,UYellow,UBlue,UPurple,UCyan,UWhite                            Underlined Colors
# @constant IBlack,IRed,IGreen,IYellow,IBlue,IPurple,ICyan,IWhite                            High Intensty Colors
# @constant BIBlack,BIRed,BIGreen,BIYellow,BIBlue,BIPurple,BICyan,BIWhite                    Bold High Intensty Colors
# @constant On_Black,On_Red,On_Green,On_Yellow,On_Blue,On_Purple,On_Cyan,On_White            Background Colors
# @constant On_IBlack,On_IRed,On_IGreen,On_IYellow,On_IBlue,On_IPurple,On_ICyan,On_IWhite    High Intensty Background Colors

# @constant-header Others
# @constant True True Value (0)
# @constant False False Value (1)

# @param-header General Parameters
# @param param1 string[val1] Description

# Bold
BBlack='\e[1;30m' BRed='\e[1;31m' BGreen='\e[1;32m' BYellow='\e[1;33m' BBlue='\e[1;34m' BPurple='\e[1;35m' BCyan='\e[1;36m' BWhite='\e[1;37m'
# Underline
UBlack='\e[4;30m' URed='\e[4;31m' UGreen='\e[4;32m' UYellow='\e[4;33m' UBlue='\e[4;34m' UPurple='\e[4;35m' UCyan='\e[4;36m' UWhite='\e[4;37m'
# Background
On_Black='\e[40m' On_Red='\e[41m' On_Green='\e[42m' On_Yellow='\e[43m' On_Blue='\e[44m' On_Purple='\e[45m' On_Cyan='\e[46m' On_White='\e[47m'
# High Intensty
IBlack='\e[0;90m' IRed='\e[0;91m' IGreen='\e[0;92m' IYellow='\e[0;93m' IBlue='\e[0;94m' IPurple='\e[0;95m' ICyan='\e[0;96m' IWhite='\e[0;97m'
# Bold High Intensty
BIBlack='\e[1;90m' BIRed='\e[1;91m' BIGreen='\e[1;92m' BIYellow='\e[1;93m' BIBlue='\e[1;94m' BIPurple='\e[1;95m' BICyan='\e[1;96m' BIWhite='\e[1;97m'
# High Intensity backgrounds
On_IBlack='\e[0;100m' On_IRed='\e[0;101m' On_IGreen='\e[0;102m' On_IYellow='\e[0;103m' On_IBlue='\e[0;104m' On_IPurple='\e[10;95m' On_ICyan='\e[0;106m' On_IWhite='\e[0;107m'

# @internal
# @description Multiline description goes here and
# there
#
# @example
#   some:other:func a b c
#   echo 123
#
# @arg $1 string Some arg.
# @arg $@ any Rest of arguments.
#
# @noargs
#
# @exitcode 0  If successfull.
# @exitcode >0 On failure
# @exitcode 5  On some error.
#
# @stdout Path to something.
#
# @see some:other:func()
some:internal:func() {
echo "ok"
}

# @description Multiline description goes here and
# there
#
# @example
#   some:other:func a b c
#   echo 123
#
# @arg $1 string Some arg.
# @arg $@ any Rest of arguments.
#
# @noargs
#
# @exitcode 0  If successfull.
# @exitcode >0 On failure
# @exitcode 5  On some error.
#
# @stdout Path to something.
#
# @see some:other:func()
some:first:func() {
echo "ok"
}