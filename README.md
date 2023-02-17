# Seattle Public Library Checkouts 2022  📚

This project aims to query and visualize the Checkouts by Title dataset found on Seattle Open Data. The dataset used within this project has been filtered to only contain data from 2022. The filtered dataset is not included due to file size upload limitations. Individuals can access the complete unfiltered dataset with the link below.

Dataset: https://data.seattle.gov/Community/Checkouts-by-Title/tmmm-ytt6

Created with: 
- SQL
- Python

Main Python Libraries:
- pandas
- matplotlib

## SQL Queries 📄

The following are examples of queries that can be used with the Checks by Title dataset.

1. Display the items that were checked out more than 1,000 times in a single month 
    ```
    SELECT *
    FROM dbo.Checkouts_by_Title_2022
    WHERE Checkouts >= 1000
    ORDER BY CAST(Checkouts AS INT) DESC;
    ```
2. Display the top 10 most checked out audio books of December 2022 
    ```
    SELECT TOP 10 *
    FROM dbo.Checkouts_by_Title_2022
    WHERE MaterialType = 'AUDIOBOOK'
	    AND CheckoutMonth = '12'
    ORDER BY Checkouts DESC;
    ```
3. Display the total checkouts of the products offered by the Seattle Public Library
    ```
    SELECT DISTINCT Title, SUM(Checkouts) AS 'Total Checkouts'
    FROM dbo.Checkouts_by_Title_2022
    WHERE Publisher = 'Seattle Public Library'
    GROUP BY Title
    ORDER BY SUM(Checkouts) DESC;
    ```
4. Display the top 5 most checked out horror ebook of October
    ```
    SELECT Top 5 Title, SUM(Checkouts) AS ' Checkouts', Subjects
    FROM dbo.Checkouts_by_Title_2022
    WHERE CHARINDEX('Mystery', Subjects) > 0
    GROUP BY Title, Subjects
    ORDER BY SUM(Checkouts) DESC;
    ```
5. Display the top 5 most checked out horror ebook of October
    ```
    SELECT Top 5 Title, SUM(Checkouts) AS ' Checkouts', Subjects
    FROM dbo.Checkouts_by_Title_2022
    WHERE CHARINDEX('Horror', Subjects) > 0
	    AND MaterialType = 'EBOOK'
	    AND CheckoutMonth = '10'
    GROUP BY Title, Subjects
    ORDER BY SUM(Checkouts) DESC;
    ```
## Python Visualizations 📈
![Subjects](https://github.com/garlandzhao/Seattle-Public-Library-Checkouts-2022/blob/b6b92dd85c28b6e0b6ad4421ce0074928eb60973/Media/Subjects.png)

The bar graph above displays the top 10 most common subjects. Fiction is the most frequently occurring subject found across all checked out products.

![Products](https://github.com/garlandzhao/Seattle-Public-Library-Checkouts-2022/blob/b6b92dd85c28b6e0b6ad4421ce0074928eb60973/Media/Products.png)

The bar graph above displays the top 10 most popular or checked out products. The most checked out product for 2022 are headphones from the Seattle Public Library.

![Checkouts](https://github.com/garlandzhao/Seattle-Public-Library-Checkouts-2022/blob/b6b92dd85c28b6e0b6ad4421ce0074928eb60973/Media/Checkouts.png)

The line graph displays the total number of checkouts by month. The highest number of checkouts occurred in August while the lowest number of checkouts occurred in February.

![MaterialType Distribution](https://github.com/garlandzhao/Seattle-Public-Library-Checkouts-2022/blob/b6b92dd85c28b6e0b6ad4421ce0074928eb60973/Media/MaterialType%20Distribution.png)

The pie chart above displays the distribution of the type of material that was checked out. The most commonly checked out type of material are physical books.
