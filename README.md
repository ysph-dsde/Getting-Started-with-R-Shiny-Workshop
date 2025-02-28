
# Getting Started with R Shiny Workshop

## About The Coffee, Cookie and Coding $\left(C^3\right)$ Workshops

Yale's Public Health Data Science and Data Equity (DSDE) team created this workshop series for Public Health and Biostatistics masters-level students at Yale. They are designed to help learners effectively leverage computational tools and analytical methods in their educational and professional endeavors. You can find out more about past and upcoming tutorials on our YouTube (coming soon) and [website](https://ysph.yale.edu/public-health-research-and-practice/research-centers-and-initiatives/public-health-data-science-and-data-equity/events/).


## About Workshop

**Workshop Title:** &nbsp; Getting Started with R Shiny: Build and Deploy Interactive Web Apps

**Date:** &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Monday, February $17^{\text{th}}$, 2025

Upon completing the workshop, you will be able to:
- Understand the structure of an R Shiny app, including UI (User Interface) and server components.
- Use reactive elements to make your app dynamic and interactive.
- Build a simple web application using a data example.
- Deploy Shiny apps using a self-service platform like shinyapps.io. 

You can find out more about past and upcoming tutorials on our [website](https://ysph.yale.edu/public-health-research-and-practice/research-centers-and-initiatives/public-health-data-science-and-data-equity/events/). If you are affiliated with Yale, you can set up an office hour appointment with one of the data scientists ([Bookings Page](https://outlook.office365.com/owa/calendar/DataScienceDataEquityOfficeHours@yale.edu/bookings/)).


## About Repository

This is the only repository associated with this workshop. It contains all of the relevant code, the data set, and a PDF of the slide deck that was used in the workshop. Limited comments were added to the slide deck PDF. Users who wish to see these extra commentaries will need to download the PDF to their local device.

### Overview Of Contents

- **For the worked through example and challenge questions:** `app.R`
- **R version:** 4.4.1

**NOTE:** The cleaning and census harmonization scripts have already been run to generate the necessary files called in the analysis workflow. Users of this repository will only need to open the `Analysis Script_Vaccinations Time-Series Plot.R`.

## Using this Repository

### Making a Clean-Break Copy

The repository needs to be copied into your personal GitHub for the workshop in a manner that will decouple its operations from this original repository. Please use one of the following two methods to do this.

**METHOD 1:** Copying Using GitHub Importer

**NOTE:** This method is not a Fork. You can learn more about GitHub Importer [here](https://docs.github.com/en/migrations/importing-source-code/using-github-importer/importing-a-repository-with-github-importer).

1. Under the "Repositories" tab of your personal GitHub page, select the "New" button in the top-right corner. This will start the process of starting a new repository.

2. At the top of the page is a hyperlink to import a repository. Open that link ([GitHub Importer](https://github.com/new/import)).

3. Paste the URL of this repository when prompted. No credentials are required for this action.

4. Adjust the GitHub account owner as needed and create the name for the new repository. We recommend initially setting the repository to Private.

5. Proceed with cloning the newly copied repository.

**METHOD 2:** Copying Using Terminal

These directions follow GitHub's [duplicating a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository) page.

1. [Create a new](https://github.com/new) GitHub repository ([Further documentation](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)).
   
   **NOTE:** Do not use a template or include a description, README file, .gitignore, or license. Only adjust the GitHub account owner as needed and create the name for the new repository. We recommend initially setting the repository to Private.
   
2. Open Terminal.

3. Navigate to the file location you want to store the repository copy.
   ```
   cd "/file_location/"
   ```

4. Clone a bare copy of the repository.
   ```
   # using SSH
   git clone --bare git@github.com:ysph-dsde/Getting-Started-with-R-Shiny-Workshop.git
   
   # or using HTTPS
   git clone --bare https://github.com/ysph-dsde/Getting-Started-with-R-Shiny-Workshop.git
   ```
   
5. Open the project file.
   ```
   cd "Getting-Started-with-R-Shiny-Workshop.git"
   ```
   
6. Push a mirror of the cloned Git file to your newly created GitHub repository.
   ```
   # using SSH
   git push --mirror git@github.com:EXAMPLE-USER/NEW-REPOSITORY.git

   # or using HTTPS
   git push --mirror https://github.com/EXAMPLE-USER/NEW-REPOSITORY.git
   ```

7. Delete the bare cloned file used to create a new remote repository.
   ```
   cd ..                                                     # Go back one file location
   rm -rf Getting-Started-with-R-Shiny-Workshop.git          # Delete the bare clone
   ```
8. Proceed with cloning the newly copied repository.

### Cloning the Copied Repository

Now that you have copied this repository into your own GitHub, you are ready to proceed with a standard clone to your local device.
  
1. Open Terminal.

2. Navigate to the file location you want to store the repository copy.
   ```
   cd "/file_location/"
   ```
3. Clone the newly created GitHub repository.
   ```
   # using SSH
   git clone git@github.com:EXAMPLE-USER/NEW-REPOSITORY.git

   # or using HTTPS
   git clone https://github.com/EXAMPLE-USER/NEW-REPOSITORY.git
   ```

4. **OPTIONAL:** You can reset the repository history, which will clear the previous commits, by running the following block of code (Source: [StackExchange by Zeelot](https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository)).
    ```
    git checkout --orphan tempBranch         # Create a temporary branch
    git add -A                               # Add all files and commit them
    git commit -m "Reset the repo"
    git branch -D main                       # Deletes the main branch
    git branch -m main                       # Rename the current branch to main
    git push -f origin main                  # Force push main branch to GitHub
    git gc --aggressive --prune=all          # Remove the old files
    ```

## About Original Data Source

The [Johns Hopkins Coronavirus Resource Center](https://coronavirus.jhu.edu/) (JHU CRC) tracked and compiled global COVID-19 pandemic data from January 22, 2020 and March 10, 2023. These data are publically available through their two GitHub repositories. We imported cumulative vaccination counts for the U.S. from their [GovEX/COVID-19](https://github.com/govex/COVID-19/tree/master/data_tables/vaccine_data) GitHub repository. The raw data used in the analysis script can be found in the data_tables/vaccine_data/us_data/time_series subdirectory ([original source](https://github.com/govex/COVID-19/blob/master/data_tables/vaccine_data/us_data/time_series/time_series_covid19_vaccine_us.csv)).

The data dictionary provided by JHU CRC has been copied to this repository ([original source](https://github.com/govex/COVID-19/tree/master/data_tables/vaccine_data/us_data)). Additional details and methods for harmonizing the U.S. Census Bureau's 2010 to 2019 population projections with 2020 to 2023 vintages can be found in the "Population Estimates and Projections" subdirectory of this GitHub repository.
