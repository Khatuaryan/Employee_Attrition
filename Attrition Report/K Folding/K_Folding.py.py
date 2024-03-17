import pandas as pd
from sklearn.model_selection import KFold

# Load your dataset
data = pd.read_csv('Dummy.csv')

# Define the number of folds for k-fold cross-validation
k = 5  # You can change this value according to your needs

# Initialize the KFold object
kf = KFold(n_splits=k, shuffle=True, random_state=42)

# Iterate over the folds
fold_number = 1
for train_index, test_index in kf.split(data):
    # Get the training and testing data for this fold
    train_data, test_data = data.iloc[train_index], data.iloc[test_index]
    
    # Save the training and testing data to CSV files
    train_data.to_csv(f'training_fold_{fold_number}.csv', index=False)
    test_data.to_csv(f'testing_fold_{fold_number}.csv', index=False)
    
    fold_number += 1
