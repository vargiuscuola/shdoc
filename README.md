# shdoc

Converts comments to function to reference markdown documentation.
This is a modified version of [reconquest/shdoc](https://github.com/reconquest/shdoc) with the following additions:
* Added support for defining settings, global variables and constants
* Added support for aliases to functions
* Added support for options in functions
* Added default value for settings and arguments
* Optionally show internal functions documentation through the use of the `@show-internal` directive
* Escape markdown characters in non descriptive elements (variable names and exit codes)  
  This allows to correctly render the following example:
  ```console
  # @exitcode >0 On failure
  ```
* Added support for a `@return` tag which specify an optional return value from a function stored in a global variable as scalar $__, array $__a or hash $__h (which can be used to avoid running a subshell as in `ret=$(func)`)

# Usage

shdoc expects a shell script in stdin and will produce markdown as stdout.

```
$ shdoc < your-shell-script.sh > doc.md
```

## Global Script tags

shdoc will match comments in the following form on top of a script file:
```sh
#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.
```

Will produce the following output:

```markdown
# Title of file script

Small description of the script.
```

## Function tags

shdoc will match comments in the following form before function definitions:

```sh
# @description Multiline description goes here and
# there
#
# @example
#   module.func a b c
#   => a b c
#
# @arg $1 string Some arg.
# @arg $2 number[15] Some other arg.
# @arg $@ any Rest of arguments.
#
# @noargs
#
# @opt --opt1 Description for option n. 1
# @opt --opt2 Description for option n. 2
#
# @exitcode 0  If successfull.
# @exitcode >0 On failure
# @exitcode 5  On some error.
# @exitcodes Standard exit codes (alternative to @exitcode)
#
# @alias module.func
# @alias module.func-alt
#
# @stdout Path to something.
# @stderr Error messages.
#
# @return Path to something.
#
# @see module_func2()
module_func() {
```

`shdoc.awk` has no args and expects shell script with comments as described
above on the stdin and will print the markdown documentation on stdout.

The above example produce the following output:
````markdown

* [some:first:func()](#somefirstfunc)


## module_func()

Multiline description goes here and
there

### Example

```bash
module.func a b c
=> a b c
```

### Arguments

* **$1** (string): Some arg.
* **$2** (number)[default: **15**]: Some other arg.
* **...** (any): Rest of arguments.

_Function has no arguments._

### Options

* **--opt1**: Description for option n. 1
* **--opt2**: Description for option n. 2

### Exit codes

* **0**:  If successfull.
* **\>0**: On failure
* **5**:  On some error.
* Standard exit codes (alternative to @exitcode)

### Aliases

* **module.func**
* **module.func-alt**

### Output on stdout

* Path to something.

### Output on stderr

* Error messages.

### Return with global scalar $__, array $__a or hash $__h

* Path to something.

#### See also

* [module_func2()](#module_func2c())
````

When you want to skip documentation generation for particular function, use `@internal` tag in the line before the `@description` tag.
It allows you to have the same style of doc comments across the script and keep internal
functions hidden.

If you want to generate documentation also for internal functions, you can use the directive `@show-internal` anywhere in the file, probably better at the top of the file.

## Constants, Global Variables and Settings
shdoc will match comments in the following for constant, global variables and settings definitions:
```sh
# @constant-header Terminal color codes
# @constant Color_Off                                       Disable color
# @constant Black,Red,Green,Yellow,Blue,Purple,Cyan,Orange  Regular Colors

# @constant-header Others
# @constant True True Value (0)
# @constant False False Value (1)

# @setting-header General Settings
# @setting setting1 string[val1] Description
# @setting _MAIN__SETTING2_<scriptname> string[<pid of process>] Pid of process \<scriptname\>

# @global-header Optional Global Variables Header
# @global GLOBALVAR1 type Description
# @global _TRAP__SIGNAL_HOOKS_<signal> Array List of hooks for signal \<signal\>
```

The above definition will produce following output:

````markdown
# Constants

## Terminal color codes
* **Color_Off**: Disable color
* **Black,Red,Green,Yellow,Blue,Purple,Cyan,Orange**: Regular Colors
## Others
* **True**: True Value (0)
* **False**: False Value (1)


# Settings

## General Settings
* **setting1** (string)[default: **val1**]: Description
* **\_MAIN__SETTING1_\<scriptname\>** (string)[default: **\<pid of process\>**]: pid of process \<scriptname\>


# Global Variables

## Optional Global Variables Header
* **GLOBALVAR1** (type): Description
* **\_TRAP__SIGNAL_HOOKS_\<signal\>** (Array): List of hooks for signal \<signal\>
````

# Markdown escaping

Note that non descriptive parts of tags are escaped to allow them to be reported literally and not be interpreted by the markdown parser.
Specifically, are escaped the following elements:
* the first element of tags `@const`, `@global`, `@setting` and `@exitcode` (i.e. the variable name or exit code value)
* the third element of tags `@setting` and `@arg` (i.e. the default value)

The characters escaped are `<>*#[]` and `_` only at the beginning or end of the value.



# Examples

See example documentation on:

* [test.sh](examples/test.md)
* [tests.sh](https://github.com/reconquest/tests.sh/blob/master/REFERENCE.md)
* [coproc.bash](https://github.com/reconquest/coproc.bash/blob/master/REFERENCE.md)
