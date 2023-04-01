
Create Table #TempSalary (SalaryID  Int , Salary Money)

INSERT Into #TempSalary values (1, 5000.00)
INSERT Into #TempSalary values (2, 7000.00)
INSERT Into #TempSalary values (3, 9000.00)
INSERT Into #TempSalary values (4, 6000.00)
INSERT Into #TempSalary values (5, 3500.00)
INSERT Into #TempSalary values (6, 4500.00)
INSERT Into #TempSalary values (7, 8500.00)
INSERT Into #TempSalary values (8, 8000.00)
INSERT Into #TempSalary values (9, 4500.00)
INSERT Into #TempSalary values (10, 5000.00)



Select * from   #TempSalary;

/*---------Mean--------------*/
SELECT AVG(Salary) AS Mean_Salary  from Salary;

/*----------Median-----------*/


Declare @Median Money
SELECT @Median = AVG(1.0 * Salary)
FROM
(
    SELECT a.Salary, rn = ROW_NUMBER() OVER (ORDER BY a.Salary),
	c.c
    FROM #TempSalary AS a
    CROSS JOIN (SELECT c = COUNT(*) FROM #TempSalary) AS c
) AS x
WHERE rn IN ((c + 1)/2, (c + 2)/2);

Select  @Median AS Median_Salary;


/*-----------Mode1 ------------*/

With MODE_Salary as (
Select Salary ,Count(*) as ModeCount from #TempSalary
Group BY Salary)
Select * from MODE_Salary
Where ModeCount=(Select Max(ModeCount) from MODE_Salary);



DROP TABLE #TempSalary