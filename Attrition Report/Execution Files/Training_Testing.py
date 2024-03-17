import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score

# Load the dataset
df = pd.read_csv("Encoded_Dataset.csv")

# Separate features and target variable
X = df.drop(columns=["Attrition"])
y = df["Attrition"]

# Perform label encoding for target variable
label_encoder = LabelEncoder()
y = label_encoder.fit_transform(y)

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Initialize classifiers
knn = KNeighborsClassifier()
dt = DecisionTreeClassifier(random_state=42)
rf = RandomForestClassifier(random_state=42)
svm = SVC(random_state=42)

# Train classifiers
knn.fit(X_train, y_train)
dt.fit(X_train, y_train)
rf.fit(X_train, y_train)
svm.fit(X_train, y_train)

# Predictions
knn_train_pred = knn.predict(X_train)
knn_test_pred = knn.predict(X_test)

dt_train_pred = dt.predict(X_train)
dt_test_pred = dt.predict(X_test)

rf_train_pred = rf.predict(X_train)
rf_test_pred = rf.predict(X_test)

svm_train_pred = svm.predict(X_train)
svm_test_pred = svm.predict(X_test)

# Calculate accuracies
knn_train_accuracy = accuracy_score(y_train, knn_train_pred)
knn_test_accuracy = accuracy_score(y_test, knn_test_pred)

dt_train_accuracy = accuracy_score(y_train, dt_train_pred)
dt_test_accuracy = accuracy_score(y_test, dt_test_pred)

rf_train_accuracy = accuracy_score(y_train, rf_train_pred)
rf_test_accuracy = accuracy_score(y_test, rf_test_pred)

svm_train_accuracy = accuracy_score(y_train, svm_train_pred)
svm_test_accuracy = accuracy_score(y_test, svm_test_pred)

# Create a DataFrame to display accuracies
results = pd.DataFrame({
    "Model": ["KNN", "Decision Tree", "Random Forest", "SVM"],
    "Training Accuracy": [knn_train_accuracy, dt_train_accuracy, rf_train_accuracy, svm_train_accuracy],
    "Testing Accuracy": [knn_test_accuracy, dt_test_accuracy, rf_test_accuracy, svm_test_accuracy]
})

# Display results
print(results)

