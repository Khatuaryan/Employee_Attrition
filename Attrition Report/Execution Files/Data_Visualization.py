import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
NEW = pd.read_csv('Encoded_Dataset.csv')  # Update 'your_dataset.csv' with your dataset filename

# Visualize Attrition counts
plt.figure(figsize=(8, 6))
sns.countplot(x='Attrition', data=NEW)
plt.title('Attrition Counts')
plt.xlabel('Attrition')
plt.ylabel('Count')
plt.show()

# Visualize Attrition distribution by other variables (example: Department)
plt.figure(figsize=(10, 6))
sns.countplot(x='Department', hue='Attrition', data=NEW)
plt.title('Attrition Distribution by Department')
plt.xlabel('Department')
plt.ylabel('Count')
plt.legend(title='Attrition', loc='upper right')
plt.show()

# Visualize Attrition distribution by Age (example)
plt.figure(figsize=(10, 6))
sns.histplot(x='Age', hue='Attrition', data=NEW, bins=20, kde=True)
plt.title('Attrition Distribution by Age')
plt.xlabel('Age')
plt.ylabel('Count')
plt.legend(title='Attrition', loc='upper right')
plt.show()

# You can create more visualizations based on your specific dataset and variables of interest

# Visualize Attrition distribution by EducationField
plt.figure(figsize=(10, 6))
sns.countplot(x='EducationField', hue='Attrition', data=NEW)
plt.title('Attrition Distribution by Education Field')
plt.xlabel('Education Field')
plt.ylabel('Count')
plt.legend(title='Attrition', loc='upper right')
plt.xticks(rotation=45)
plt.show()

# Visualize Attrition distribution by JobRole
plt.figure(figsize=(12, 6))
sns.countplot(x='JobRole', hue='Attrition', data=NEW)
plt.title('Attrition Distribution by Job Role')
plt.xlabel('Job Role')
plt.ylabel('Count')
plt.legend(title='Attrition', loc='upper right')
plt.xticks(rotation=45)
plt.show()

# Visualize Attrition distribution by YearsAtCompany
plt.figure(figsize=(10, 6))
sns.histplot(x='YearsAtCompany', hue='Attrition', data=NEW, bins=20, kde=True)
plt.title('Attrition Distribution by Years at Company')
plt.xlabel('Years at Company')
plt.ylabel('Count')
plt.legend(title='Attrition', loc='upper right')
plt.show()

# Visualize Attrition distribution by MonthlyIncome
plt.figure(figsize=(10, 6))
sns.histplot(x='MonthlyIncome', hue='Attrition', data=NEW, bins=20, kde=True)
plt.title('Attrition Distribution by Monthly Income')
plt.xlabel('Monthly Income')
plt.ylabel('Count')
plt.legend(title='Attrition', loc='upper right')
plt.show()