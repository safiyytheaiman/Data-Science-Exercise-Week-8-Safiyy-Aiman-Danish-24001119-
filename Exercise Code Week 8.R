#WEEK 8 ASSIGNMENT
#Clear Environment
rm(list = ls())

#Load package
library(dplyr)

#Check Directory RStudio is Searching
getwd()

#If CSV file is not found in directory, set RCode to search another directory
setwd("C:/Users/safiy/OneDrive/Documents/UTP/MAY 2026/Data Science")

#Load dataset from CSV file
student_data <- read.csv("student_data.csv")

# =========================================
#Q1
#Show the details of students whose final_exam_mark is greater than 80%
# =========================================
students_above_80 <- student_data %>%
  filter(final_exam_mark > 80)
View(students_above_80)

# =========================================
#Q2
#Arrange the dataset in ascending order based on course_work_mark
# =========================================
sorted_data <- student_data %>%
  arrange(course_work_mark)
View(sorted_data)

# =========================================
#Q3
#Display only the student_name and final_exam_mark
# =========================================
student_final_marks <- student_data %>%
  select(student_name, final_exam_mark)
View(student_final_marks)

# =========================================
#Q4
#Specify the number of rows and columns
# =========================================
cat("Number of rows:", nrow(student_data), "\n")
cat("Number of columns:", ncol(student_data), "\n")

# =========================================
#Q5
#Display dataset details
# =========================================
head(student_data)
str(student_data)
summary(student_data)
glimpse(student_data)

# =========================================
#Q6
#Identify and detect outliers
# =========================================
Q1 <- quantile(student_data$final_exam_mark, 0.25)
Q3 <- quantile(student_data$final_exam_mark, 0.75)
IQR_value <- IQR(student_data$final_exam_mark)

lower_limit <- Q1 - 1.5 * IQR_value
upper_limit <- Q3 + 1.5 * IQR_value

outliers <- student_data %>%
  filter(final_exam_mark < lower_limit | final_exam_mark > upper_limit)

print("Outliers:")
print(outliers)

boxplot(
  student_data$final_exam_mark,
  main = "Boxplot of Final Exam Marks",
  ylab = "Final Exam Mark"
)