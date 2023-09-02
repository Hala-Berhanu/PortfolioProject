# PortfolioProject
## COVID-19 Data Analysis Using SQL
In this project, I am analyzing a covid 19 data set. I split the data into two different files. One is 'COVID death', which has all the information regarding the cases and deaths for each country; the other is 'COVID vaccination ', which includes information regarding the vaccination from February 2020 till October 2021. with more than 100,000 records. The purpose of this project is to analyze and extract important
pieces of information.

I obtained the data from 'ourworldindata.com' and will use my SQL to analyze it.
Some of the information to extract from the data is 
* What percent of the population gets COVID in THE United Arab Emirates?
* The chance of death if a person is infected based on each country 
* What are the countries with the highest infection rate?
* What are the countries with the highest death count?
* What is the continent with the highest death rate?
* What is the global daily death rate?
* what is the rolling people vaccinated?
  
 ### * What percent of the population gets COVID in THE United Arab Emirates?
  Here to find the case percentage per population I divided the total number of cases by population and multiplied by 100.
  <img width="511" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/ed05ff5a-dba7-4a36-9856-50424498e724">
  <img width="352" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/a7b79a21-3649-4725-8e15-931b41037a5a">
  
  We can see that at first the cases were very few almost zero percent however when I ordered the data in descending order by date
  
  <img width="516" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/99a1de5a-f91c-462f-923a-c6e9320fc2e6">
  <img width="354" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/b52a0a3c-a8b0-4e21-a473-674bd4cc58bf">
  
    we can see that the percentage increased to 7.4%.



### * The chance of death if a person is infected based on each country 
<img width="530" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/b233a13b-baa7-4b64-be0c-85cc09e51212">

Here to find the death percentage per case I divided the total number of deaths by the total cases and multiplied by 100.
I added a where clause focused only on the united arab Emirates and 

<img width="361" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/aad316e2-6710-4e61-9ce0-600597039f70">

As we can see there was a 0.5% chance of death if a person had COVID-19 in the UAE

### * What are the countries with the highest infection rate
To find the country's highest infection rate, first, we have to group the data based on location and extract the highest case percentage in the select. at the end order the result by case_dpercentage in descending orders. 
<img width="521" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/c8115137-4ca7-4d80-b247-d83467752287">
<img width="287" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/152715a4-f352-4696-a5b8-c1d4ab86b5f0">

### * What are the countries with the highest death count?
<img width="309" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/4a5cdb47-5555-416d-ab83-74a1bf1b6ebd">
<img width="170" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/c5b2a646-4ae1-420a-a359-65ae1e13d13d">

The United States was the country with the highest death number followed by Brazil and India.

### *What is the continent with the highest death rate?

<img width="291" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/74375d48-6610-4683-902b-7e1241ea6028">
<img width="185" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/9f78e45f-7b00-43f6-8225-06e6d24e4683">

To find the total death for each continent I grouped the data by continent and excluded all null values in the where clause. I added the deaths using sum, and at the end ordered the result in descending order.
we can see that Europe had the highest death number. 

### * What is the global daily death rate?

<img width="397" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/d12b4184-2dc0-422e-8b0e-bee592c0448d">
<img width="268" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/70522e25-7063-4f2c-9755-dc7aa2d5e7cc">

To find the daily global death rate The focus should be on the sum of daily new deaths and daily new cases then convert it to percentage.


### *What is the rolling of people vaccinated?
<img width="571" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/ad6440c2-310c-4ca3-ab12-88a5cd81f96a">
<img width="421" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/786ebb67-e5ec-4375-be0e-77d57035e2ea">

First I have to join both the death and vaccination tables and find the rolling of people vaccinated we sum the new vaccination partition by location

To convert the vaccination rolling into percentage I used CTA

<img width="557" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/e040c071-85f8-4868-b488-fb7f23db0ea7">
<img width="484" alt="image" src="https://github.com/Hala-Berhanu/PortfolioProject/assets/71036477/6a30e408-e989-4a05-9147-e181225006b7">

Then select the vaccination rolling and convert it to a percentage by diving with the population.
We can also use View to safe it for later visualisation 

















