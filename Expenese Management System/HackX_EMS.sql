CREATE DATABASE Employee_EMS;

CREATE TABLE Manager(MANAGER_ID INTEGER PRIMARY KEY,
                     FNAME VARCHAR(15),
                     LNAME VARCHAR(15),
                     EMAIL VARCHAR(50),
                     DEPARTMENT VARCHAR(25));

CREATE TABLE Employee(EMP_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
                      FNAME VARCHAR(15),
                      LNAME VARCHAR(15),
                      DEPARTMENT VARCHAR(30) CHECK (DEPARTMENT IN ('SALES', 'RESEARCH & DEVELOPMENT', 'HUMAN RESOURCES')),
                      MANAGER_ID INTEGER,
                      FOREIGN KEY(MANAGER_ID) REFERENCES Manager(MANAGER_ID));

CREATE TABLE ExpenseReport(REPORT_ID INTEGER PRIMARY KEY,
                           EMP_ID INTEGER,
                           REPORT_DATE DATE,
                           STATUS VARCHAR(15),
                           TOTAL_AMOUNT DECIMAL(10, 2),
                           FOREIGN KEY (EMP_ID) REFERENCES Employee(EMP_ID));

CREATE TABLE ExpenseItems(ITEM_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
                          REPORT_ID INTEGER,
                          EXPENSE_TYPE VARCHAR(15),
                          AMOUNT DECIMAL(10, 2),
                          DESCRIPTION TEXT,
                          FOREIGN KEY(REPORT_ID) REFERENCES ExpenseReport(REPORT_ID));

INSERT INTO Manager(MANAGER_ID, FNAME, LNAME, EMAIL, DEPARTMENT)
VALUES
    (1, "Aryan", "Khatu", "aryan.khatu066@nmims.edu.in", "SALES"),
    (2, "Tanay", "Koli", "tanay.koli062@nmims.edu.in", "RESEARCH & DEVELOPMENT"),
    (3, "Darsh", "Iyer", "darsh.iyer038@nmims.edu.in", "HUMAN RESOURCES");

INSERT INTO Employee(EMP_ID, FNAME, LNAME, DEPARTMENT, MANAGER_ID)
VALUES
 (1, "SMIT", "PATIL", "SALES", NULL),
(2, "MAHESH", "CHOUDHARY", "SALES", NULL),
(3, "PRAJIT", "DEWRIARY", "SALES", NULL),
(4, "MANJINDAR", "SINGH", "SALES", NULL),
(5, "ABHINAV", "KIDAV", "SALES", NULL),
(6, "REHAAN", "KHAN", "HUMAN RESOURCES", NULL),
(7, "KANISHK", "KUMAR", "HUMAN RESOURCES", NULL),
(8, "MALAY", "THORIA", "HUMAN RESOURCES", NULL),
(9, "LUCKY", "MANKAME", "HUMAN RESOURCES", NULL),
(10, "ADITYA", "KURUP", "HUMAN RESOURCES", NULL),
(11, "SYOUG", "KSHIRSAGAR", "RESEARCH & DEVELOPMENT", NULL),
(12, "ARYAN", "KHARATE", "RESEARCH & DEVELOPMENT", NULL),
(13, "RISHABH", "SULTANIA", "RESEARCH & DEVELOPMENT", NULL),
(14, "AAGAM", "CHOPRA", "RESEARCH & DEVELOPMENT", NULL),
(15, "DWIJ", "NATHANI", "RESEARCH & DEVELOPMENT", NULL),
(16, "ARYAN", "KHATU", "SALES", 1),
(17, "TANAY", "KOLI", "RESEARCH & DEVELOPMENT", 2),
(18, "DARSH", "IYER", "HUMAN RESOURCES", 3);

CREATE TRIGGER update_expense_report_total
AFTER INSERT ON ExpenseItems
FOR EACH ROW
BEGIN
  UPDATE ExpenseReport
  SET TOTAL_AMOUNT = (SELECT SUM(amount) FROM ExpenseItems WHERE REPORT_ID = NEW.REPORT_ID)
  WHERE REPORT_ID = NEW.REPORT_ID;
END;

INSERT INTO ExpenseReport (REPORT_ID, EMP_ID, REPORT_DATE, STATUS)
VALUES
  (1, 16, CURDATE() - INTERVAL (RAND() * 30) DAY, 'Submitted'),
  (2, 17, CURDATE() - INTERVAL (RAND() * 30) DAY, 'Submitted'),
  (3, 18, CURDATE() - INTERVAL (RAND() * 30) DAY, 'Submitted');

INSERT INTO ExpenseItems (ITEM_ID, REPORT_ID, EXPENSE_TYPE, AMOUNT, DESCRIPTION)
VALUES
  (1, 1, 'Travel', RAND() * 10000, 'Travel Expense'),
  (2, 2, 'Meals', RAND() * 5000, 'Meal Expense'),
  (3, 3, 'Office Supplies', RAND() * 2500, 'Office Supply Expense'),
  (4, 2, 'Meals', RAND()*1500, 'Bali Presentation Stay Meals');
;

INSERT INTO ExpenseItems (REPORT_ID, EXPENSE_TYPE, AMOUNT, DESCRIPTION)
VALUES
  (1, 'Meals', RAND() * 5000, 'Meal Expense'),
  (1, 'Hotel', RAND() * 2000, 'Hotel Expense'),
  (1, 'Transport', RAND() * 5000, 'Transport Expense'),
  (2, 'Meals', RAND() * 5000, 'Meal Expense'),
  (2, 'Hotel', RAND() * 2000, 'Hotel Expense'),
  (2, 'Transport', RAND() * 5000, 'Transport Expense'),
  (3, 'Meals', RAND() * 5000, 'Meal Expense'),
  (3, 'Hotel', RAND() * 2000, 'Hotel Expense'),
  (3, 'Transport', RAND() * 5000, 'Transport Expense'),
  (1, 'Travel', RAND() * 10000, 'Travel Expense'),
  (2, 'Travel', RAND() * 10000, 'Travel Expense'),
  (3, 'Travel', RAND() * 10000, 'Travel Expense'),
  (1, 'Office Supplies', RAND() * 2500, 'Office Supply Expense'),
  (2, 'Office Supplies', RAND() * 2500, 'Office Supply Expense'),
  (3, 'Office Supplies', RAND() * 2500, 'Office Supply Expense'),
  (1, 'Communication', RAND() * 5000, 'Communication Expense'),
  (2, 'Communication', RAND() * 5000, 'Communication Expense'),
  (3, 'Communication', RAND() * 5000, 'Communication Expense'),
  (1, 'Training', RAND() * 5000, 'Training Expense'),
  (2, 'Training', RAND() * 5000, 'Training Expense'),
  (3, 'Training', RAND() * 5000, 'Training Expense'),
  (1, 'Marketing', RAND() * 5000, 'Marketing Expense'),
  (2, 'Marketing', RAND() * 5000, 'Marketing Expense'),
  (3, 'Marketing', RAND() * 5000, 'Marketing Expense'),
  (1, 'Rent', RAND() * 5000, 'Rent Expense'),
  (2, 'Rent', RAND() * 5000, 'Rent Expense'),
  (3, 'Rent', RAND() * 5000, 'Rent Expense'),
  (1, 'Utilities', RAND() * 5000, 'Utilities Expense'),
  (2, 'Utilities', RAND() * 5000, 'Utilities Expense'),
  (3, 'Utilities', RAND() * 5000, 'Utilities Expense'),
  (1, 'Legal', RAND() * 5000, 'Legal Expense'),
  (2, 'Legal', RAND() * 5000, 'Legal Expense'),
  (3, 'Legal', RAND() * 5000, 'Legal Expense'),
  (1, 'Insurance', RAND() * 5000, 'Insurance Expense'),
  (2, 'Insurance', RAND() * 5000, 'Insurance Expense'),
  (3, 'Insurance', RAND() * 5000, 'Insurance Expense'),
  (1, 'Repairs', RAND() * 5000, 'Repairs Expense'),
  (2, 'Repairs', RAND() * 5000, 'Repairs Expense'),
  (3, 'Repairs', RAND() * 5000, 'Repairs Expense'),
  (1, 'Consulting', RAND() * 5000, 'Consulting Expense'),
  (2, 'Consulting', RAND() * 5000, 'Consulting Expense'),
  (3, 'Consulting', RAND() * 5000, 'Consulting Expense'),
  (1, 'Licensing', RAND() * 5000, 'Licensing Expense'),
  (2, 'Licensing', RAND() * 5000, 'Licensing Expense'),
  (3, 'Licensing', RAND() * 5000, 'Licensing Expense');

# Most Common Expense Types
SELECT EXPENSE_TYPE, COUNT(*) AS NumberOfOccurrences
FROM ExpenseItems
GROUP BY EXPENSE_TYPE
ORDER BY NumberOfOccurrences DESC
LIMIT 10;

# Managers with the Most Direct Reports
SELECT m.FNAME, m.LNAME, COUNT(*) AS NumDirectReports
FROM Manager m
LEFT JOIN Employee e ON e.MANAGER_ID = m.MANAGER_ID
GROUP BY m.MANAGER_ID, m.FNAME, m.LNAME
ORDER BY NumDirectReports DESC;
