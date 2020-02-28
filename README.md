# shdoc

Converts comments to function to reference markdown documentation.
This is a modified version of [reconquest/shdoc](https://github.com/reconquest/shdoc) with the following additions:
* Added support for defining params, environment variables and constants
* Added default value for params and arguments
* Optionally show internal functions documentation through the use of the `@show-internal` directive
* Escape markdown characters in non descriptive elements (variable names and exit codes)  
  This allows to correctly render the following example:
  ```console
  # @exitcode >0 On failure
  ```
* Added support for a `@return` tag which specify an optional return value from a function stored in a global variable as $__ or $_<MODULE>__ (which I use often to avoid running a subshell as in `ret=$(func)`)

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

Will produce following output:

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
#   some:other:func a b c
#   echo 123
#
# @arg $1 string Some arg.
# @arg $2 number[15] Some other arg.
# @arg $@ any Rest of arguments.
#
# @noargs
#
# @exitcode 0  If successfull.
# @exitcode >0 On failure
# @exitcode 5  On some error.
# @exitcodes Standard exit codes (alternative to @exitcode)
#
# @stdout Path to something.
# @stderr Error messages.
#
# @return Path to something.
#
# @see some:other:func()
some:first:func() {
```

`shdoc.awk` has no args and expects shell script with comments as described
above on the stdin and will markdown output result on the stdout.

Will produce following output:
````markdown

* [some:first:func()](#somefirstfunc)


## some:first:func()

Multiline description goes here and
there

### Example

```bash
some:other:func a b c
echo 123
```

### Arguments

* **$1** (string): Some arg.
* **$2** (number)[default: **15**]: Some other arg.
* **...** (any): Rest of arguments.

_Function has no arguments._

### Exit codes

* **0**:  If successfull.
* **\>0**: On failure
* **5**:  On some error.
* Standard exit codes (alternative to @exitcode)

### Output on stdout

* Path to something.

### Output on stderr

* Error messages.

### Return with global $__ or $_<MODULE>__

* Path to something.

#### See also

* [some:other:func()](#some:other:func())
````

When you want to skip documentation generation for particular function, use `@internal` tag in the line before the `@description` tag.
It allows you to have the same style of doc comments across the script and keep internal
functions hidden from users.

If you want to generate documentation also for internal functions, you can use the directive `# @show-internal` anywhere in the file, probably better at the top of the file.

## Constants, Environment Variables and Parameters
shdoc will match comments in the following for constant, environment variables and parameters definitions:
```sh
# @constant-header Terminal color codes
# @constant Color_Off                                       Disable color
# @constant Black,Red,Green,Yellow,Blue,Purple,Cyan,Orange  Regular Colors

# @constant-header Others
# @constant True True Value (0)
# @constant False False Value (1)

# @param-header General Parameters
# @param param1 string[val1] Description
# @param _MAIN__PARAM2_<scriptname> string[<pid of process>] Pid of process \<scriptname\>

# @environment-header Optional Environment Variables Header
# @environment ENV1 type Description
# @environment _TRAP__SIGNAL_HOOKS_<signal> Array List of hooks for signal \<signal\>
```

The above definition will produce following output:

````markdown
## Constants

### Terminal color codes
* **Color_Off**: Disable color
* **Black,Red,Green,Yellow,Blue,Purple,Cyan,Orange**: Regular Colors
### Others
* **True**: True Value (0)
* **False**: False Value (1)


## Parameters

### General Parameters
* **param1** (string)[default: **val1**]: Description
* **\_MAIN__PARAM1_\<scriptname\>** (string)[default: **\<pid of process\>**]: pid of process \<scriptname\>


## Environments Variables

### Optional Environment Variables Header
* **ENV1** (type): Description
* **\_TRAP__SIGNAL_HOOKS_\<signal\>** (Array): List of hooks for signal \<signal\>
````

# Markdown escaping

Note that non descriptive parts of tags are escaped to allow them to be reported literally and not be interpreted by the markdown parser.
Specifically, are escaped the following elements:
* the first element of tags `@const`, `@environment`, `@param` and `@exitcode` (i.e. the variable name or exit code value)
* the third element of tags `@param` and `@arg` (i.e. the default value)

The characters escaped are `<>*#[]` and `_` only at the beginning or end of the value.



# Examples

See example documentation on:

* [test.sh](examples/test.md)
* [tests.sh](https://github.com/reconquest/tests.sh/blob/master/REFERENCE.md)
* [coproc.bash](https://github.com/reconquest/coproc.bash/blob/master/REFERENCE.md)