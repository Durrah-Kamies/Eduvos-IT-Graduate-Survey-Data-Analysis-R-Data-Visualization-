# Eduvos Graduate Survey Analysis Project

## Overview

This project analyzes survey data from Eduvos IT graduates to understand the tech tools and programming languages they are currently using in the industry. The analysis helps Eduvos update their IT courses to ensure they teach skills that are relevant to current industry needs.

## Project Structure

```
ITRDA ASSIGNMENT UPDATED/
|-- README.md                    # This file
|-- graduate_survey.csv          # Raw survey dataset (56MB)
|-- q12.R                        # R script for Questions 1 & 2 (Data cleaning and visualization)
|-- q3.R                         # R script for Question 3 (Shiny dashboard)
|-- Eduvos-IT-Dashboard/         # Shiny dashboard deployment folder
|   |-- README.md                # Dashboard-specific README
|   |-- q12.R                    # Copy of analysis script
|   |-- q3.R                     # Copy of dashboard script
|   |-- .git/                    # Git repository for deployment
|   |-- .gitattributes           # Git attributes
|   |-- ITRDA ASSIGNMENT UPDATED.Rproj
|   `-- ITRDA-Q4,Q3 Link.docx    # Deployment links document
|-- .RData                       # R workspace data
|-- .Rhistory                    # R command history
`-- .gitignore                   # Git ignore file
```

## Assignment Questions

### Question 1: Data Cleaning and Preprocessing (20 Marks)
- Select relevant columns from the survey dataset
- Handle missing values
- Standardize categorical columns (e.g., campus names)
- Subset data to contain 3-5 campuses with most responses
- Justify all cleaning steps taken

### Question 2: Data Visualization (30 Marks)
Create visualizations to answer:
- **Top tools analysis** (12 marks): Programming languages, databases, AI tools, web frameworks, cloud platforms
- **Industry analysis** (8 marks): Most popular industries by study field
- **Job roles analysis** (5 marks): Top job roles by study field  
- **Employment analysis** (5 marks): Employment rates by study field

### Question 3: Shiny Dashboard (25 Marks)
Create an interactive R Shiny dashboard with:
- **Layout and Design** (6 marks): User interface and consistent styling
- **Data Visualization** (8 marks): Variety of clear, useful visualizations
- **Interactivity** (5 marks): Interactive elements and user experience
- **Documentation** (6 marks): Code documentation and user guide

### Question 4: Comprehensive Report (25 Marks)
Write a professional report including:
- **Introduction** (3 marks): Purpose and analysis scope
- **Data Overview** (3 marks): Dataset summary and cleaning steps
- **Insights and Analysis** (10 marks): Analysis of tools, databases, frameworks, platforms, AI tools
- **Recommendations** (6 marks): Curriculum updates and industry alignment strategies
- **Conclusion** (3 marks): Key findings and potential impact

## Key Data Columns

The analysis focuses on these survey columns:
- `Campus`: Eduvos campus location
- `StudyField`: IT, Data Science, or Computer Science
- `Branch`: Primary type of work
- `Role`: Developer role type
- `EduLevel`: Highest education level
- `ProgLang`: Programming languages (semicolon-separated)
- `Databases`: Databases used (semicolon-separated)
- `Platform`: Cloud platforms (semicolon-separated)
- `WebFramework`: Web frameworks (semicolon-separated)
- `Industry`: Industry sectors (semicolon-separated)
- `AISearch`: AI search tools (semicolon-separated)
- `AITool`: AI developer tools (semicolon-separated)
- `Employment`: Employment status and type

## Getting Started

### Prerequisites
- R and RStudio installed
- Required R packages: `dplyr`, `ggplot2`, `readr`, `tidyr`, `shiny`

### Running the Analysis

1. **Data Cleaning and Visualization**:
   ```r
   source("q12.R")
   ```

2. **Shiny Dashboard**:
   ```r
   source("q3.R")
   # Or run the dashboard directly:
   shiny::runApp()
   ```

### Data Processing Notes

- Multiple tool selections in survey responses are separated by semicolons (`;`)
- Campus names need standardization (e.g., Durban and Umhlanga)
- Missing values are handled appropriately
- Data is subsetted to focus on campuses with the most responses

## Deployment

The Shiny dashboard is deployed to a GitHub repository and can be accessed online. Deployment links are documented in `ITRDA-Q4,Q3 Link.docx`.

## Author

**Durrah Kamies**
- Assignment: ITRDA3-11-ASSIGNMENT-MOWBRAY-CT.2023
- Course: IT Data Research and Analytics

## Submission Details

- **Institution**: Eduvos
- **Campus**: Mowbray
- **Academic Period**: 2023.Q5
- **Assignment Type**: ITRDA (IT Data Research and Analytics)

---

*This project was completed as part of the ITRDA3-11 course at Eduvos, focusing on data analysis and visualization techniques for educational institution improvement.*
