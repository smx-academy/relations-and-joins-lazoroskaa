CREATE TABLE Clients(
	ClientID INT PRIMARY KEY NOT NULL,
	FirstName VARCHAR (100),
	LastName VARCHAR (100),
	BirthDate DATE,
	Adress VARCHAR (100),
	PhoneNum VARCHAR (15),
	Email VARCHAR (50) UNIQUE,
	AccountCreatedDate DATE
);

CREATE TABLE Accounts (
    AccountId INT PRIMARY KEY NOT NULL,
    ClientId INT NOT NULL,
    AccountType VARCHAR(20) NOT NULL CHECK (AccountType IN ('Savings', 'Checking')),
    Balance DECIMAL(15, 2) DEFAULT 0.00,
    OpenDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Active', 'Closed', 'Suspended'))
);

CREATE TABLE Savings (
    SavingsID INT PRIMARY KEY NOT NULL,
    AccountID INT NOT NULL,
    Balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
);

CREATE TABLE DebitCards (
    CardID INT PRIMARY KEY NOT NULL,
    ClientID INT NOT NULL,                    
    AccountID INT NOT NULL,                   
    CardNumber VARCHAR(16) NOT NULL UNIQUE,   
    CVV VARCHAR(3) NOT NULL UNIQUE,
    CardStatus VARCHAR(20) NOT NULL CHECK (CardStatus IN ('Active', 'Blocked')),
	ExpiryDate DATE NOT NULL,
    IssuedDate DATE NOT NULL,
);

CREATE TABLE Credits (
    CreditID INT PRIMARY KEY,
    ClientID INT NOT NULL,                    
    AccountID INT NOT NULL,                   
    LoanAmount DECIMAL(15, 2) NOT NULL,       
    LoanDurationMonths INT NOT NULL,   
	RemainingBalance DECIMAL(15, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Active', 'Closed')),
);

------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Clients (ClientID, FirstName, LastName, BirthDate, Adress, PhoneNum, Email, AccountCreatedDate)
VALUES
(10101, 'Ivan', 'Petrovski', '1985-03-22', 'Bul. Partizanska 12, Skopje', '+38970123456', 'ivan.petrov@gmail.com', '2023-01-15'),
(10202, 'Marija', 'Ilievska', '1990-07-11', 'Ul. Ilindenska 34, Bitola', '+38970234567', 'marija.ilievska@yahoo.com', '2022-06-25'),
(10303, 'Dragan', 'Kostov', '1975-09-30', 'Ul. Marshal Tito 56, Ohrid', '+38970345678', 'dragan.kostov@hotmail.com', '2021-12-10'),
(10404, 'Snezana', 'Jovanovska', '1988-02-19', 'Bul. Kliment Ohridski 78, Tetovo', '+38970456789', 'snezana.jovanovska@gmail.com', '2023-03-20'),
(10505, 'Bojan', 'Stojanovski', '1995-05-15', 'Ul. Goce Delcev 90, Veles', '+38970567890', 'bojan.stojanovski@outlook.com', '2021-09-05');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Accounts (AccountId, ClientId, AccountType, Balance, OpenDate, Status)
VALUES
(20001, 10101, 'Savings', 12500.50, '2023-01-15', 'Active'),
(20002, 10202, 'Checking', 8500.00, '2022-06-25', 'Active'),
(20003, 10303, 'Savings', 10250.75, '2021-12-10', 'Suspended'),
(20004, 10404, 'Checking', 4200.00, '2023-03-20', 'Active'),
(20005, 10505, 'Savings', 15250.00, '2021-09-05', 'Closed');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Savings (SavingsID, AccountID, Balance)
VALUES
(30001, 20001, 12500.50),
(30002, 20003, 10250.75),
(30003, 20005, 15250.00);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DebitCards (CardID, ClientID, AccountID, CardNumber, CVV, CardStatus, ExpiryDate, IssuedDate)
VALUES
(40001, 10101, 20001, '9876123498761234', '112', 'Active', '2027-01-15', '2023-01-15'),
(40002, 10202, 20002, '8765432187654321', '223', 'Active', '2026-06-25', '2022-06-25'),
(40003, 10303, 20003, '7654321076543210', '334', 'Blocked', '2025-12-10', '2021-12-10'),
(40004, 10404, 20004, '6543210965432109', '445', 'Active', '2028-03-20', '2023-03-20'),
(40005, 10505, 20005, '5432109854321098', '556', 'Active', '2026-09-05', '2021-09-05');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Credits (CreditID, ClientID, AccountID, LoanAmount, LoanDurationMonths, RemainingBalance, StartDate, EndDate, Status)
VALUES
(50001, 10101, 20001, 50000.00, 60, 30000.00, '2018-01-15', '2023-01-15', 'Closed'),
(50002, 10202, 20002, 25000.00, 48, 5000.00, '2019-06-25', '2023-06-25', 'Active'),
(50004, 10404, 20004, 30000.00, 36, 15000.00, '2020-03-20', '2023-03-20', 'Closed'),
(50005, 10505, 20005, 75000.00, 72, 45000.00, '2019-09-05', '2025-09-05', 'Active');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
	c.ClientID,
	CONCAT (c.FirstName, ' ' , c.LastName) AS ClientName,
	s.Balance
FROM 
	Clients c
INNER JOIN 
	Accounts a ON c.ClientID=a.ClientId
INNER JOIN 
	Savings s ON s.AccountID=a.AccountId
WHERE 
	s.Balance>=11000
ORDER BY 
	s.Balance ASC;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM DebitCards 
WHERE IssuedDate BETWEEN '2023-01-01' AND '2023-12-31';

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
	c.ClientID,
	CONCAT (c.FirstName, ' ',c.LastName) AS ClientName,
	cr.LoanAmount,
	cr.StartDate
FROM
	Clients c
INNER JOIN
	Credits cr ON c.ClientID=cr.ClientID
WHERE
	cr.StartDate>='2018-12-31';


