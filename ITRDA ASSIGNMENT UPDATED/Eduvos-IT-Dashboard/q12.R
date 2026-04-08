# Question 1:

# loading necessary packages
library(dplyr)
library(ggplot2)
library(readr)
library(tidyr)


# Importing the csv file
library(readr)
graduate_survey <- read_csv("graduate_survey.csv")
View(graduate_survey)

# Select relevant columns
selected_data <- graduate_survey %>%
  select(Campus, StudyField, Branch, Role, EduLevel, ProgLang, Databases, 
         Platform, WebFramework, Industry, AISearch, AITool, Employment)

# Replace missing values with empty strings in selected columns
selected_data <- selected_data %>%
  mutate(across(c(ProgLang, Databases, WebFramework, AISearch, AITool), ~ replace_na(., "")))

# Standardize Campus names 
selected_data <- selected_data %>%
  mutate(Campus = case_when(
    Campus %in% c("Durban", "Umhlanga") ~ "Durban",
    TRUE ~ Campus
  ))

# Subset data to only the top 3-5 campuses with the most responses
# Count responses per campus
campus_count <- selected_data %>%
  group_by(Campus) %>%
  summarise(ResponseCount = n()) %>%
  arrange(desc(ResponseCount))

# top 5 campuses
top_campuses <- campus_count %>%
  top_n(5, ResponseCount) %>%
  pull(Campus)

# Subset data to include only the top campuses
filtered_data <- selected_data %>%
  filter(Campus %in% top_campuses)

# Check the cleaned data
head(filtered_data)


# Load required libraries
library(tidyverse)
library(ggplot2)

# Filter top 10 programming languages and plot
prog_lang_count <- selected_data %>%
  separate_rows(ProgLang, sep = ";") %>%
  filter(ProgLang != "") %>%
  count(ProgLang) %>%
  arrange(desc(n))

# Plot the top 10 programming languages
ggplot(prog_lang_count %>% top_n(10, n), aes(x = reorder(ProgLang, n), y = n)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(title = "Top 10 Programming Languages", x = "Programming Language", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# AI Search Tools
ai_search_count <- selected_data %>%
  separate_rows(AISearch, sep = ";") %>%
  filter(AISearch != "") %>%
  count(AISearch) %>%
  arrange(desc(n)) %>%
  top_n(10, n)

# AI Developer Tools
ai_tool_count <- selected_data %>%
  separate_rows(AITool, sep = ";") %>%
  filter(AITool != "") %>%
  count(AITool) %>%
  arrange(desc(n)) %>%
  top_n(10, n)

# Count industries
industry_count <- selected_data %>%
  separate_rows(Industry, sep = ";") %>%
  filter(Industry != "") %>%
  count(Industry) %>%
  arrange(desc(n)) %>%
  top_n(10, n)

# Plot the top industries
ggplot(industry_count, aes(x = reorder(Industry, n), y = n)) +
  geom_bar(stat = "identity", fill = "pink") +
  labs(title = "Top 10 Industries for Graduates", x = "Industry", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 55, hjust = 1))

# Count job roles
role_count <- selected_data %>%
  separate_rows(Role, sep = ";") %>%
  filter(Role != "") %>%
  count(Role) %>%
  arrange(desc(n)) %>%
  top_n(10, n)

# Plot the top roles
ggplot(role_count, aes(x = reorder(Role, n), y = n)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(title = "Top 10 Job Roles for Graduates", x = "Job Role", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Create a new column for simplified employment status
selected_data <- selected_data %>%
  mutate(SimplifiedEmployment = case_when(
    grepl("Employed", Employment, ignore.case = TRUE) ~ "Employed",
    grepl("Not employed", Employment, ignore.case = TRUE) ~ "Not Employed",
    TRUE ~ "Other"
  ))

# Employment rate calculation
employment_rate <- selected_data %>%
  group_by(StudyField, SimplifiedEmployment) %>%
  summarise(Count = n(), .groups = "drop") %>%
  pivot_wider(names_from = SimplifiedEmployment, values_from = Count, values_fill = 0)

# Add employment rate column
employment_rate <- employment_rate %>%
  mutate(Total = Employed + Other, EmploymentRate = (Employed / Total) * 100)

# Plot employment rate by study field
ggplot(employment_rate, aes(x = StudyField, y = EmploymentRate)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  labs(title = "Employment Rate by Study Field", x = "Study Field", y = "Employment Rate (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1))
