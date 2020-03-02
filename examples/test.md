# Title of file script

Small description of the script.

## Constants

### Terminal color codes
* **Color_Off**: Disable color
* **Black,Red,Green,Yellow,Blue,Purple,Cyan,Orange**: Regular Colors
* **BBlack,BRed,BGreen,BYellow,BBlue,BPurple,BCyan,BWhite**: Bold Colors
* **UBlack,URed,UGreen,UYellow,UBlue,UPurple,UCyan,UWhite**: Underlined Colors
* **IBlack,IRed,IGreen,IYellow,IBlue,IPurple,ICyan,IWhite**: High Intensty Colors
* **BIBlack,BIRed,BIGreen,BIYellow,BIBlue,BIPurple,BICyan,BIWhite**: Bold High Intensty Colors
* **On_Black,On_Red,On_Green,On_Yellow,On_Blue,On_Purple,On_Cyan,On_White**: Background Colors
* **On_IBlack,On_IRed,On_IGreen,On_IYellow,On_IBlue,On_IPurple,On_ICyan,On_IWhite**: High Intensty Background Colors
### Others
* **True**: True Value (0)
* **False**: False Value (1)


## Settings

### General Settings
* **\_MAIN__SETTING1_\<scriptname\>** (string)[default: **\<pid of process\>**]: pid of process \<scriptname\>


## Global Variables

### Optional Global Variables Header
* **ENV1** (type): Description
* **\_TRAP__SIGNAL_HOOKS_\<signal\>** (Array): List of hooks for signal \<signal\>


## Functions
* [module_func()](#module_func)


### module_func()

Multiline description goes here and
there

#### Example

```bash
first:func a b c
echo 123
```

#### Arguments

* **$1** (string): Some arg.
* **...** (any): Rest of arguments.

_Function has no arguments._

#### Exit codes

* **0**:  If successfull.
* **\>0**: On failure
* **5**:  On some error.

#### Aliases

* **module.func**
* **module.func-alt**

#### Output on stdout

* Path to something.

#### Output on stderr

* Error messages.

#### Return with global $__ or $_\<MODULE\>__

* Path to something.

#### See also

* [some:other:func()](#some:other:func())



## Internal Functions
* [module_func2()](#module_func2)


### module_func2()

Multiline description goes here and
there

#### Example

```bash
module_func2 a b c
```

#### Arguments

* **$1** (string): Some arg.
* **$2** (number)[default: **15**]: Some other arg.
* **...** (any): Rest of arguments.

_Function has no arguments._

#### Exit codes

* **0**:  If successfull.
* **\>0**: On failure
* **5**:  On some error.
* Standard exit codes (alternative to @exitcode)

#### Output on stdout

* Path to something.


