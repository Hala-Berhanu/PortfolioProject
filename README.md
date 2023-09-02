# PortfolioProject
## COVID-19 Data Analysis Using SQL
In this project, I conducted an in-depth analysis of a COVID-19 dataset sourced from 'ourworldindata.com.' The dataset was divided into two distinct files: 'COVID Death' containing comprehensive information about cases and fatalities for various countries, and 'COVID Vaccination,' which encompassed vaccination data spanning from February 2020 to October 2021, totaling over 100,000 records. The primary objective of this undertaking was to extract and analyze critical insights using SQL."
Some of the information to extract from the data is 
* What percent of the population gets COVID in THE United Arab Emirates?
* The chance of death if a person is infected based on each country 
* What are the countries with the highest infection rate?
* What are the countries with the highest death count?
* What is the continent with the highest death rate?
* What is the global daily death rate?
* What are the rolling people vaccinated?


### First let's see what both the tables look like.

<img width="651" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/d81831e7-68e6-4c8a-98a5-138ff6fedf4d">

<img width="649" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/8090c105-e1c7-4b5c-b635-cc40594b0b94">


  
 ### * What percent of the population gets COVID in THE United Arab Emirates?
  To determine the case percentage relative to the population, I calculated it by dividing the total number of cases by the population and then multiplying the result by 100.
  <img width="511" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/ed05ff5a-dba7-4a36-9856-50424498e724">
  <img width="352" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/a7b79a21-3649-4725-8e15-931b41037a5a">
  
  Initially, the cases constituted a negligible percentage, nearly zero. However, upon arranging the data in descending order by date, we observed a subsequent increase to 7.4%."
  
  <img width="516" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/99a1de5a-f91c-462f-923a-c6e9320fc2e6">
  <img width="354" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/b52a0a3c-a8b0-4e21-a473-674bd4cc58bf">
  
 
### * The chance of death if a person is infected based on each country 
<img width="530" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/b233a13b-baa7-4b64-be0c-85cc09e51212">

"To calculate the death percentage per case, I divided the total number of deaths by the total cases and then multiplied the result by 100. Specifically focusing on the United Arab Emirates, we found that there was a 0.5% fatality rate for individuals with COVID-19 in the UAE.

<img width="361" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/aad316e2-6710-4e61-9ce0-600597039f70">


### * What are the countries with the highest infection rate

To identify the country with the highest infection rate, I begin by grouping the data by location and extracting the highest case percentage in the select statement. Finally, I sort the results in descending order based on the case percentage.

<img width="521" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/c8115137-4ca7-4d80-b247-d83467752287">
<img width="287" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/152715a4-f352-4696-a5b8-c1d4ab86b5f0">

### * What are the countries with the highest death count?
<img width="309" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/4a5cdb47-5555-416d-ab83-74a1bf1b6ebd">
<img width="170" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/c5b2a646-4ae1-420a-a359-65ae1e13d13d">

The United States was the country with the highest death number followed by Brazil and India.

### *What is the continent with the highest death rate?

<img width="291" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/74375d48-6610-4683-902b-7e1241ea6028">
<img width="185" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/9f78e45f-7b00-43f6-8225-06e6d24e4683">

To determine the total deaths for each continent, I grouped the data by continent, excluded null values in the where clause, and applied the 'sum' function to aggregate the deaths. The results were then sorted in descending order, revealing that Europe had the highest number of fatalities.

### * What is the global daily death rate?

<img width="397" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/d12b4184-2dc0-422e-8b0e-bee592c0448d">
<img width="268" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/70522e25-7063-4f2c-9755-dc7aa2d5e7cc">

To find the daily global death rate The focus should be on the sum of daily new deaths and daily new cases then convert it to percentage.


### *What is the rolling of people vaccinated?
<img width="571" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/ad6440c2-310c-4ca3-ab12-88a5cd81f96a">
<img width="421" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/786ebb67-e5ec-4375-be0e-77d57035e2ea">

Initially, I performed a join operation between the death and vaccination tables. Next, I computed the rolling total of vaccinated individuals by summing the new vaccinations partitioned by location. To convert this rolling total into a percentage, I applied a Common Table Expression (CTA).

<img width="557" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/e040c071-85f8-4868-b488-fb7f23db0ea7">
<img width="484" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/6a30e408-e989-4a05-9147-e181225006b7">

Afterward, I calculated the vaccination rate by dividing the vaccination rolling total by the population. To facilitate future visualization, I utilized a View to store this data.

<img width="558" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/7d438d02-6d08-4578-9a25-007383e20742">



"In summary, my analysis reveals compelling insights from the COVID-19 dataset. The United States of America had the highest total number of deaths. However, when examining death rates by continent, Europe emerges as the frontrunner.

Delving into the global daily death rate in relation to case numbers, I observed a significant shift over time. In February 2020, the fatality rate for COVID-19 stood at a daunting 28%. Remarkably, by October 2021, this figure had plummeted to nearly 2%. It's noteworthy that the first vaccination efforts commenced in December 2020.

To accomplish these findings, I harnessed a variety of SQL functions and techniques. I employed joins to seamlessly integrate data from both the death and vaccination tables, harnessed aggregation commands like 'sum' in conjunction with arithmetic operations to calculate percentages, utilized subqueries in conjunction with Common Table Expressions (CTAs) to retrieve critical information, and crafted views to facilitate subsequent data visualization."
















