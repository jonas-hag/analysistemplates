# The analysistemplates package

Currently, this package provides one standard data analysis template for RStudio projects.
It is geared towards scientific use cases.

## Installation

``` r
remotes::install_github("jonas-hag/analysistemplates")
```

## Usage

1.  Install the package
2.  Restart RStudio
3.  When creating a new RStudio project with the "New directory" option, choose "Standard analysis template"
4.  During initialization you can select if a folder called `06_Analysis_for_publication` is included (check "Include Analysis for publication folder")
5.  You can select if you want to generate a `.gitignore` file (check "Create a .gitignore file")
6.  You can select if you want to use `renv` (check "Use renv with this project")
7.  Once you've created the project, you will be provided with the instructions how to create a git repository for your project
