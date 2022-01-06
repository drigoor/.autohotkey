# Windows Productivity with Autohotkey
My custom shortcuts for Windows using [autohotkey](https://www.autohotkey.com).
Currently some programs were installed via [scoop](https://scoop.sh).

This allows to quickly open the required program with the keyboard, e.g. open applications with custom layouts, open specific folders, apply transparency to a window, or even hide the task bar, and hide a titlebar of a window - for that _minimalist look_

Notes:
- C means Control key
- W - Windows key
- M - Alt key
- S - Shift key
- _example:_ C-c means pressing 'Control' key with 'c' key
- If a given program isn't running, open it as expected.
If it is running and not the active window, or is minimized, activated it.
If it is running and is the active window, minimize it (and the previous window become active).

## Shortcuts...

### ...when in a dos command window
|Shortcut|Description
|-|-
| C-c | same as pressing Ctr+c and answering with _y_
| C-d | same as writing _exit_ and hit enter
| C-l | same as writing _cls_ and hit enter
| W-e | same as writing _explorer ._ and hit enter

### ...when in a powershell window
|Shortcut|Description
|-|-
| C-d | same as writing _exit_ and hit enter
| W-e | same as writing _explorer ._ and hit enter

### ...when in a bash shell window
|Shortcut|Description
|-|-
| W-e | same as writing _explorer ._ and hit enter

### ...when in the desktop / autohotkey _program manager_
|Shortcut|Description
|-|-
| W-i | opens autohotkey _Windows Spy_

### ...all remaining cases
|Shortcut|Description
|-|-
| C-M-r | Reloads the autohotkey configuration file
| W-f1 | Change to desktop #1
| W-f2 | Change to desktop #2
| W-i | opens a small ephemeral window with info regarding the current window
| W-h | opens a small ephemeral window with the current hour
| W-c | opens the windows _startup_ folder

|Shortcut|Description
|-|-|
| W-f5 | For the current window, center it, and resize it to 1920x1080
| W-f6 | For the current window, center it, and resize it to 1280x720
| W-f7 | For the current window, center it, and resize it to 835x500

|Shortcut|Description
|-|-
| W+Enter | open a git bash shell
| W+S+Enter | open a cmd window
| W-M-Enter | open a powershell window
| W-n | open or activate / minimize _notepad_
| W-3 | open emacs
| W-S-3 | open emacs without initialisations

Documentation isn't cheap, read the code :)
