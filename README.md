## Screenshots

![screenshot 1](img/screenshot_1.png)

## Dependencies

- pandoc (for format conversion) : `sudo apt install pandoc`
- python3 (for pandoc's filter) : `sudo apt install python3`
- fortune (to display data) : `sudo apt install fortune fortune-mod`

## Install
`sudo make install`

## Options


| Option      | Description                                                                                              |
|-------------|----------------------------------------------------------------------------------------------------------|
| `-n <N>`    | Show at most `N` proofs. Default : `1000`                                                                |
| `-s <ERE>`  | **S**earch theorems which match given extended regular expression (ERE, see `man grep`). Default : `"*"` |
| `-p`        | Show theorem's **p**roof(s).                                                                             |
| `-l <lang>` | Show only proofs written in `lang` **l**anguage. Default : `"*"`                                         |
| `-S`        | **S**how theorem's code.                                                                                 |
| `-P`        | Output the result as a **P**DF.                                                                          |
| `-L`        | Output the result as **L**aTeX format.                                                                   |
| `-h`        | Show **h**elp message.                                                                                   |



## TODO

1. Describe formats used
    - use inline bibtex or `bibtex` file for proofs
2. Install pandoc filter `ansify.py`
3. Release it as an ubuntu package `*.deb`


