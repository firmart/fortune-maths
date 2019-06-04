## Screenshots

![screenshot 1](img/screenshot_1.png)

## Dependencies

- perl (for markup-ansi conversion) : `sudo apt install perl`
- python3 (for cookie/data conversion) : `sudo apt install python3`
- fortune (to display data) : `sudo apt install fortune`

## Install
`sudo make install`


## TODO

1. Add more ansi markup
2. Describe formats used
    - use inline bibtex for proofs.
3. Explain options
4. Use pandoc to simplify workflow e.g. `fortune-maths -l -p | pandoc -f latex -t plain`
5. Release it as an ubuntu package

