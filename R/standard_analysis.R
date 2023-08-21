#' Create standard analysis template for RStudio project
#'
#' @param path path of the new project
#' @param include_analysis_for_publication additional Analysis for publication folder
#' @param use_renv should renv be used?
#' @param include_gitignore should a gitingore file be created
#' @param ... additional parameters, currently not used
#'
#' @return no return values, just the folders and README are created
#' @export
standard_analysis <- function(
    path,
    include_analysis_for_publication,
    use_renv,
    include_gitignore,
    ...) {
  # ensure that the path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  
  # create folder structure
  dir.create(paste0(path, "/01_Data"))
  dir.create(paste0(path, "/01_Data/01_Raw"))
  dir.create(paste0(path, "/01_Data/02_Clean"))
  
  dir.create(paste0(path, "/02_Analysis"))
  dir.create(paste0(path, "/02_Analysis/01_Scripts"))
  dir.create(paste0(path, "/02_Analysis/02_Results"))
  dir.create(paste0(path, "/02_Analysis/03_Figures"))
  dir.create(paste0(path, "/02_Analysis/04_Tables"))
  
  dir.create(paste0(path, "/03_Manuscript"))
  dir.create(paste0(path, "/03_Manuscript/01_Text"))
  dir.create(paste0(path, "/03_Manuscript/02_Final_figures"))
  
  dir.create(paste0(path, "/04_Presentation"))
  
  dir.create(paste0(path, "/05_Misc"))
  
  if (include_analysis_for_publication) {
    dir.create(paste0(path, "/06_Analysis_for_publication"))
    dir.create(paste0(path, "/06_Analysis_for_publication/01_Scripts"))
    dir.create(paste0(path, "/06_Analysis_for_publication/02_Results"))
    dir.create(paste0(path, "/06_Analysis_for_publication/03_Figures"))
    dir.create(paste0(path, "/06_Analysis_for_publication/04_Tables"))
  }
  
  # create a .gitignore file
  if (include_gitignore) {
    gitignore_content <- c(
      ".Rproj.user",
      ".Rhistory",
      ".RData",
      ".Ruserdata",
      "01_Data",
      "*/02_Results",
      "*/03_Figures",
      "*/04_Tables",
      "03_Manuscript/02_Final_figures",
      "04_Presentation",
      "*.html"
    )
  }
  
  gitignore_content <- paste0(gitignore_content, collapse = "\n")
  writeLines(gitignore_content, con = file.path(path, ".gitignore"))
  
  # create a readme
  content <- c(
    "# Readme",
    "This is the template for a standard data analysis.",
    "Please give an overview what you do in this project and how to navigate it.",
    "",
    "## Git integration",
    "If you want to use git with your project (you should!), please do the following steps (replace `<name of your repository>` with the actual name):",
    "",
    "1.  Go to your git repository provider (github/gitlab) and create a new repository",
    "2.  DON'T check 'Add a README file'",
    "3.  Go to the Terminal within RStudio and type the following commands (for the URL, e.g. https://github.com):",
    "",
    "```bash",
    "git init",
    "git branch -M main",
    "git remote add origin <URL of your github/gitlab instance>/<name of your repository>.git",
    "```",
    "",
    "4.  Restart RStudio",
    "5.  Select the files you want to commit in the git pane, click 'commit', in the pop-up write a commit message and click 'commit'",
    "6.  In the terminal, execute the following command:",
    "",
    "```bash",
    "git push -u origin main",
    "```",
    "",
    "7.  For the following commits, you can use the 'push' button in the git pane",
    "",
    "Please note that the following directories and files are not tracked by git by default (but you can change it in the .gitignore file):",
    "",
    "-   01_Data",
    "-   all 02_Results folders",
    "-   all 03_Figures folders",
    "-   all 04_Tables folders",
    "-   03_Manuscript/02_Final_figures",
    "-   04_Presentation",
    "-   all html files",
    "",
    "For more information about the integration of git and RStudio, check out https://happygitwithr.com."
  )
  content <- paste0(content, collapse = "\n")
  writeLines(content, con = file.path(path, "README.md"))
  
  # initialise renv
  if (use_renv) {
    if ("renv" %in% rownames(installed.packages())) {
      renv::init(
        project = normalizePath(path),
        bare = TRUE
      )
    } else {
      warning("renv couldn't be used as the `renv` package is not installed. If you want to use renv, please first install it with `install.packages('renv')`")
    }
  }
}
