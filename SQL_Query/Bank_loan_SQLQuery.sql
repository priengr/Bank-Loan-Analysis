SELECT * FROM Bank_loan_data

--Total Loan Appli'n-->
SELECT COUNT(id) AS Total_Loan_Applications FROM Bank_loan_data;

--Total Loan Appli'n with month to date and month to month-->
SELECT COUNT(id) AS Total_Loan_Applications_MTD FROM Bank_loan_data
WHERE MONTH(issue_date)=12

--Total Funded Amount-->
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM Bank_loan_data

--Total Amount Recevived-->
SELECT SUM(total_payment) As Total_Amount_Recevied FROM Bank_loan_data

--AVG intrest rate -->
SELECT round(AVG(int_rate)*100,2) AS AVG_intrest_rate FROM Bank_loan_data

--Avg Debt-to-Income Ratio-->
SELECT ROUND(AVG(dti)*100,2) AS Avg_Debt_to_Income FROM Bank_loan_data 


SELECT * FROM Bank_loan_data
--Good Loan KPIs:->

--Good Loan Application Percentage-->
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(id) AS Good_loan_percentage
FROM Bank_loan_data 

--Good loan appli'n-->
SELECT COUNT(id) AS Good_loan_appli FROM Bank_loan_data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good loan funded amount-->
SELECT SUM(loan_amount) AS Good loan_funded_amount FROM Bank_loan_data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Total Received Amount-->
SELECT SUM(total_payment) AS Good_Loan_Total_Received_Amount FROM Bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Bad Loan KPIs:-->
SELECT * FROM Bank_loan_data

--Bad Loan Application Percentage-->
SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END )*100)/COUNT(id) AS Bad_Loan_Appli_Perc
FROM Bank_loan_data

--Bad Loan Applications-->
SELECT COUNT(id) AS Total_Bad_Loan FROM Bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount:-->
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM  Bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Total Received Amount-->

SELECT SUM(total_payment) AS Bad_Loan_Total_Received_Amount FROM  Bank_loan_data
WHERE loan_status = 'Charged Off'


--Loan_Status_Grid_View-->
SELECT 
 loan_status,
 COUNT(id) AS Total_Loan_Appli,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Amount_Received,
 ROUND(AVG(int_rate*100),2) AS Average_Interest_Rate,
 ROUND(AVG(dti*100),2) AS Average_Debt_to_income_Ratio
FROM 
 Bank_loan_data
GROUP BY 
 loan_status
 
--DASHBOARD 2: OVERVIEW-->

--Monthly Trends by Issue Date-->
SELECT 
	MONTH(issue_date) AS Month_number,
	DATENAME(MONTH,issue_date) AS Month_name,
	COUNT(id) AS Total_Loan_Appli,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date)

--Regional Analysis by State-->
SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Appli,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY address_state
ORDER BY address_state

--Loan Term Analysis -->
SELECT 
	term AS Loan_Terms,
	COUNT(id) AS Total_Loan_Appli,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY term
ORDER BY term

--Employee Length Analysis -->
SELECT 
	emp_length AS Employee_Length,
	COUNT(id) AS Total_Loan_Appli,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

--Loan Purpose Breakdown -->
SELECT 
	purpose AS Loan_Purpose,
	COUNT(id) AS Total_Loan_Appli,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY purpose

--Home Ownership Analysis-->
SELECT 
	home_ownership AS Home_Ownership_ategories ,
	COUNT(id) AS Total_Loan_Appli,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY home_ownership

--DASHBOARD 3:
SELECT * FROM Bank_loan_data