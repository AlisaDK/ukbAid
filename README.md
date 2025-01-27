
-   <a href="#ukbaid-aid-in-doing-analyses-on-the-uk-biobank-rap"
    id="toc-ukbaid-aid-in-doing-analyses-on-the-uk-biobank-rap">ukbAid: Aid
    in doing analyses on the UK Biobank RAP</a>
    -   <a href="#installation" id="toc-installation">Installation</a>
    -   <a href="#using-ukbaid" id="toc-using-ukbaid">Using ukbAid</a>
        -   <a href="#steps-when-outside-the-ukb-rap"
            id="toc-steps-when-outside-the-ukb-rap">Steps when outside the UKB
            RAP</a>
        -   <a href="#steps-when-inside-the-ukb-rap-for-the-first-time"
            id="toc-steps-when-inside-the-ukb-rap-for-the-first-time">Steps when
            inside the UKB RAP <em>for the first time</em></a>
        -   <a href="#steps-when-resuming-work-in-ukb-rap"
            id="toc-steps-when-resuming-work-in-ukb-rap">Steps when resuming work in
            UKB RAP</a>
    -   <a href="#for-admin-users" id="toc-for-admin-users">For admin users</a>

<!-- README.md is generated from README.Rmd. Please edit that file -->

# ukbAid: Aid in doing analyses on the UK Biobank RAP

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of ukbAid is to help our research group at Steno Diabetes
Center Aarhus that is working on the UK Biobank on the RAP.

## Installation

You can install the development version of ukbAid inside RStudio in the
R Console like so:

``` r
# If remotes package isn't installed, first install with (without the `#` comment):
# install.packages("remotes")
remotes::install_github("steno-aarhus/ukbAid")
```

## Using ukbAid

Assumptions:

-   Each user has their own user folder inside `users/`, based on their
    user name given by the RAP.
-   Each project is a `.tar.gz` file within the users own main folder,
    for instance `users/lwjohnst/ecc-cmd-ukb.tar.gz`. The way the RAP
    system works is that each project is backed up and restored into the
    clean RStudio analysis workspace.

### Steps when outside the UKB RAP

*Note*: Some of these tasks can be really difficult to understand what’s
going on, and that’s ok and totally normal. The very start of a project
is always some of the most difficult stage of a project. But if you
follow these tasks, you’ll have a solid foundation for doing your work
within the special environment of the UK Biobank RAP.

The very first tasks you’ll need to do are to install these packages
below. In RStudio while on your computer (*not* in the RAP), copy and
paste these commands into the Console:

``` r
install.packages("usethis")
install.packages("gitcreds")
```

Then, we need to make sure that your computer has Git configured
properly. In your Console, type out the below code, replacing my name
(Luke) and my email with your own name:

``` r
ukbAid::setup_git_config("Luke W. Johnston", "lwjohnst@gmail.com")
```

You should get an output showing your `user.email` and `user.name`.
Next, we need to create the folder and file structure. In the Console,
type out this, replacing my project abbreviated name (`ecc-cmd-ukb`)
with your project abbreviated name:

``` r
ukbAid::setup_ukb_project("~/Desktop/ecc-cmd-ukb")
```

From here, go to the Desktop or wherever you created the project and
open up the RStudio `.Rproj` file so that the project starts up in
RStudio. In this project will be the files you need to get started on
the project, and especially at this stage, the `doc/protocol.Rmd` and
the `data-raw/project-variables.csv` files. You’ll be working on these
files before beginning to use the RAP and doing analyses, but once you
are ready, you’d need to have your project on GitHub to make it easier
to import into the RAP. So, before continuing further, let’s connect
your project to GitHub right from the beginning. To do that in a
relatively easy way, we have to create a thing called a Personal Access
Token (PAT) in GitHub in order for Git on your computer to know how to
connect your project to GitHub.

If you don’t have a GitHub account, create one first. After that (or if
you already have one), when in your RStudio project, in the Console type
out this command:

``` r
usethis::create_github_token()
```

This will send you to your GitHub account and create a basic PAT for
you. Change the token’s description to something like “For UKB project”.
Create the token, which will change pages and you’ll be shown a string
of letters starting with `ghp_`. Copy this token and save it somewhere
safe, preferably in a password manager. This token acts a bit like your
password but is safer to use than your password. Once you’ve saved it
somewhere, go back to RStudio and than run this command in the Console:

``` r
gitcreds::gitcreds_set()
```

And then paste the token into the prompt in the Console. Doing this is a
bit like using the 2FA message with the temporary passcode you get sent
whenever you have to open your work’s email or when you use MitID or
NemID (in Denmark). Every time you open RStudio, you need to run this
command and give R the token so that it can connect to GitHub securely.
After you’ve done this, run the next function:

``` r
usethis::use_github()
```

This will take your project and upload it to GitHub. Now, whenever you
use Git and save your changes to the Git history, whenever you “Push”
your changes it will be sent to your project on GitHub.

As you work on the project, specifically the protocol and selecting the
variables for your project from the `data-raw/project-variables.csv`
list, you’ll use Git to save the changes made and push up to GitHub.
Once your protocol has been reviewed and uploaded to OSF, you’re now
ready to start doing the data analysis on the RAP.

**But before doing anything else**, complete the tasks in the `TODO.md`
file, which will direct you to fill in details in the `README.md` and
`_targets.R` files.

### Steps when inside the UKB RAP *for the first time*

When you first open up UKB RAP, you won’t have your project files nor
have any packages installed. So you’ll need to do a few set up tasks. In
the RStudio R Console, install the remotes and ukbAid packages:

``` r
install.packages("remotes")
remotes::install_github("steno-aarhus/ukbAid")
```

Next, we’ll need to upload your project onto the RAP from GitHub. You’ll
have to give the function your GitHub user name and the repository name
for your project. Mine is
[`"lwjohnst86/ecc-cmd-ukb"`](https://github.com/lwjohnst86/ecc-cmd-ukb).
You’ll have to replace mine with your own. Type out:

``` r
usethis::create_from_github("lwjohnst86/ecc-cmd-ukb")
```

This will download the project from GitHub and create the project in the
RAP. The project should already open up for you, but if not, open the
project by clicking the `.Rproj` file inside the project folder.

Once inside the RStudio project, type out this command in the Console:

``` r
install.packages("targets")
targets::tar_make()
```

``` r
ukbAid::backup_project()
```

### Steps when resuming work in UKB RAP

``` r
install.packages("remotes")
remotes::install_github("steno-aarhus/ukbAid")
ukbAid::restore_project()
```

Then, open up the README.Rmd file and follow the instructions there.

<!-- Add instructions on saying what other packages to include in project using, like renv -->

## For admin users

This is code used only by the admins.

``` r
ukbAid:::import_clean_and_upload_database_variables()
```
