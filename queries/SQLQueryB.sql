WITH EmployeeCounts AS (
    SELECT 
        EnterpriseID,
        COUNT(CASE WHEN ContractType = 'Contract' THEN 1 ELSE NULL END) AS ContractEmployees,
        COUNT(CASE WHEN ContractType = 'Employment' THEN 1 ELSE NULL END) AS EmploymentEmployees,
        AVG(CASE WHEN ContractType = 'Contract' THEN Salary ELSE NULL END) AS AvgContractSalary,
        AVG(CASE WHEN ContractType = 'Employment' THEN Salary ELSE NULL END) AS AvgEmploymentSalary
    FROM 
        Employment
    GROUP BY 
        EnterpriseID
)
SELECT 
    AVG(ContractEmployees) AS AvgContractEmployees,
    AVG(EmploymentEmployees) AS AvgEmploymentEmployees,
    (AVG(AvgContractSalary) + AVG(AvgEmploymentSalary)) / 2 AS AvgSalary
FROM 
    EmployeeCounts;
