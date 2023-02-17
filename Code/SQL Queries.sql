--Display 100 records from the dataset
SELECT TOP 100 *
FROM dbo.Checkouts_by_Title_2022;

--Display the products that were checked out more than 1,000 times in a single month 
SELECT *
FROM dbo.Checkouts_by_Title_2022
WHERE Checkouts >= 1000
ORDER BY CAST(Checkouts AS INT) DESC;

--Display the top 10 most checked out audio books of December
SELECT TOP 10 *
FROM dbo.Checkouts_by_Title_2022
WHERE MaterialType = 'AUDIOBOOK'
	AND CheckoutMonth = '12'
ORDER BY Checkouts DESC;

--Display the total checkouts of the products offered by the Seattle Public Library
SELECT DISTINCT Title, SUM(Checkouts) AS 'Total Checkouts'
FROM dbo.Checkouts_by_Title_2022
WHERE Publisher = 'Seattle Public Library'
GROUP BY Title
ORDER BY SUM(Checkouts) DESC;

--Display the different available material types
SELECT DISTINCT MaterialType
FROM dbo.Checkouts_by_Title_2022;

--Display the checkout type used for music
SELECT CheckoutType, MaterialType
FROM dbo.Checkouts_by_Title_2022
WHERE MaterialType = 'MUSIC'
GROUP BY CheckoutType, MaterialType;

--Display the number of different creators
SELECT COUNT(DISTINCT Creator) AS 'Distinct Creators'
FROM dbo.Checkouts_by_Title_2022;

--Display the total number of checkouts from each creator
SELECT Creator, SUM(Checkouts) AS ' Checkouts'
FROM dbo.Checkouts_by_Title_2022
GROUP BY Creator
ORDER BY SUM(Checkouts) DESC;

--Display the top 5 most checked out mystery novel or media product
SELECT Top 5 Title, SUM(Checkouts) AS ' Checkouts', Subjects
FROM dbo.Checkouts_by_Title_2022
WHERE CHARINDEX('Mystery', Subjects) > 0
GROUP BY Title, Subjects
ORDER BY SUM(Checkouts) DESC;

--Display the top 5 most checked out horror ebook of October
SELECT Top 5 Title, SUM(Checkouts) AS ' Checkouts', Subjects
FROM dbo.Checkouts_by_Title_2022
WHERE CHARINDEX('Horror', Subjects) > 0
	AND MaterialType = 'EBOOK'
	AND CheckoutMonth = '10'
GROUP BY Title, Subjects
ORDER BY SUM(Checkouts) DESC;