import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier

# Load the provided data
# yes=0
# no=0
# loop=0
# while loop<=20:
    
df1 = pd.read_csv("Sample_Dataset.csv")

# Sample one row without specifying random_state
df = df1.sample(n=1)

# Remove unnecessary columns
df = df.drop(columns=["Attrition", "Unnamed: 0"])

# Label encode categorical variables if necessary
categorical_cols = ['BusinessTravel', 'Department', 'EducationField', 'Gender', 'JobRole', 'MaritalStatus', 'OverTime']
label_encoders = {}

for col in categorical_cols:
        label_encoders[col] = LabelEncoder()
        df[col] = label_encoders[col].fit_transform(df[col])

# Load the dataset used for training the Random Forest model
train_df = pd.read_csv("Sample_Dataset.csv")

# Drop 'Unnamed: 0' if it's present in the training data
train_df = train_df.drop(columns=['Unnamed: 0'])

# Separate features and target variable for training data
X_train = train_df.drop(columns=["Attrition"])
y_train = train_df["Attrition"]

# Initialize and train the Random Forest model
rf = RandomForestClassifier(random_state=42)
rf.fit(X_train, y_train)

# Predict using the trained Random Forest model
rf_pred_label = rf.predict(df)
    
# Display predictions
print(rf_pred_label)
# if rf_pred_label == 1:
#     yes+=1
# else:
#     no+=1
        
# loop+=1
    
#print("For",no,"Number of Employees Staying in Company",yes,"Number Of Employee Stays in the Company")