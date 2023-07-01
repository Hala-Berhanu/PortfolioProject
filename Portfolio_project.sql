use portfolio_project;
drop table Covid_death;

create table Covid_Death(
iso_code varchar(255),
continent varchar(255),
location varchar(255),
date date,
population bigint,
total_cases int null,
new_cases int null,
new_cases_smoothed float null,
total_deaths int null,
new_deaths int null,
new_deaths_smoothed float null,
total_cases_per_million float null,
new_cases_per_million float null,
new_cases_smoothed_per_million float null,
total_deaths_per_million float null,
new_deaths_per_million float null,
new_deaths_smoothed_per_million float null,
reproduction_rate float null,
icu_patients int null,
icu_patients_per_million float null,
hosp_patients int null,
hosp_patients_per_million float null,
weekly_icu_admissions int null,
weekly_icu_admissions_per_million float null,
weekly_hosp_admissions int null,
weekly_hosp_admissions_per_million float null
)

select* from covid_death;

load data infile 'Covid_Death.csv' into table covid_death
fields terminated by','
lines terminated by '\r\n'
ignore 1 lines
(@iso_code,@continent,@location ,@date,@population,@total_cases,@new_cases,
@new_cases_smoothed,@total_deaths,@new_deaths,@new_deaths_smoothed,@total_cases_per_million,
@new_cases_per_million ,@new_cases_smoothed_per_million,@total_deaths_per_million,
@new_deaths_per_million,@new_deaths_smoothed_per_million,@reproduction_rate ,
@icu_patients ,@icu_patients_per_million,@hosp_patients,@hosp_patients_per_million ,
@weekly_icu_admissions,@weekly_icu_admissions_per_million,@weekly_hosp_admissions,
@weekly_hosp_admissions_per_million)
set iso_code=IF(@iso_code='',NULL,@iso_code),
	continent=IF(@continent='',NULL,@continent),
    location=IF(@location='',NULL,@location),
	date=IF(@date='',Null,@date),
    population=IF(@population='',NULL,@population),
	total_cases=IF(@total_cases='',NULL,@total_cases),
    new_cases=IF(@new_cases='',NULL,@new_cases),
	new_cases_smoothed=IF(@new_cases_smoothed='',Null,@new_cases_smoothed),
    total_deaths=IF(@total_deaths='',Null,@total_deaths),
    new_deaths=IF(@new_deaths='',Null,@new_deaths),
    new_deaths_smoothed=IF(@new_deaths_smoothed='',Null,@new_deaths_smoothed),
    total_cases_per_million=IF(@total_cases_per_million='',Null,@total_cases_per_million),
    new_cases_per_million =IF(@new_cases_per_million ='',Null,@new_cases_per_million ),
    new_cases_smoothed_per_million=IF(@new_cases_smoothed_per_million='',Null,@new_cases_smoothed_per_million),
    total_deaths_per_million=IF(@total_deaths_per_million='',Null,@total_deaths_per_million),
    new_deaths_per_million=IF(@new_deaths_per_million='',Null,@new_deaths_per_million),
    new_deaths_smoothed_per_million=IF(@new_deaths_smoothed_per_million='',Null,@new_deaths_smoothed_per_million),
    reproduction_rate=IF(@reproduction_rate='',Null,@reproduction_rate),
    icu_patients=IF(@icu_patients='',Null,@icu_patients),
    icu_patients_per_million=IF(@icu_patients_per_million='',Null,@icu_patients_per_million),
    hosp_patients=IF(@hosp_patients='',Null,@hosp_patients),
    hosp_patients_per_million=IF(@hosp_patients_per_million='',Null,@hosp_patients_per_million),
    weekly_icu_admissions=IF(@weekly_icu_admissions='',Null,@weekly_icu_admissions),
    weekly_icu_admissions_per_million=IF(@weekly_icu_admissions_per_million='',Null,@weekly_icu_admissions_per_million),
    weekly_hosp_admissions=IF(@weekly_hosp_admissions='',Null,@weekly_hosp_admissions),
    weekly_hosp_admissions_per_million=IF(@weekly_hosp_admissions_per_million='',Null,@weekly_hosp_admissions_per_million);


 SELECT * FROM covid_death;
 
 -- looking for tota case vs total deaths
 -- shows likelihood of dying if you contract covid in your country
 SELECT location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
 FROM covid_death
 WHERE location LIKE'%United Arab Emirates%'
 ORDER BY 1;
 
 -- looking at total case vs population
 -- Shows what percentage of population get covid
 SELECT location, date, total_cases,population,(total_cases/population)*100 AS CasePercentage
 FROM covid_death
 WHERE location LIKE'%United Arab Emirates%'
 ORDER BY 1;
 
 -- looking at countries with highst infection rate
 SELECT location, population,max(total_cases),MAX((total_cases/population))*100 AS CasePercentage
 FROM covid_death
 -- WHERE location LIKE'%United Arab Emirates%'
 GROUP BY location
 ORDER BY CasePercentage DESC;
 
 -- looking at countries with highst death count 
 SELECT location,MAX(total_deaths) AS total_DeathCount
 FROM covid_death
 -- WHERE location LIKE'%United Arab Emirates%'
 WHERE continent IS NOT NULL
 GROUP BY location
 ORDER BY total_DeathCount DESC;
 
 -- LET'S BREAK THINGS DOWN BY CONTINENT
 -- showing continents with highest death count 
 SELECT continent,sum(new_deaths) as total_DeathCount
 FROM covid_death
 WHERE continent IS NOT NULL
 GROUP BY continent
 ORDER BY total_DeathCount DESC;
 
 
 -- GLOBAL NUMBER
 SELECT date,sum(new_deaths) AS total_death,sum(new_cases) AS total_case,
 (sum(new_deaths)/sum(new_cases))*100 as death_percentage
 FROM covid_death
 WHERE continent IS NOT NULL
 GROUP BY date;
 
 
 -- looking at total pipulation vs vacsination
 SELECT dea.continent,dea.location,dea.date,vac.new_vaccinations
 FROM portfolio_project.covid_death dea
 JOIN portfolio_project.covid_vacsination vac
	ON dea.location=vac.location
    AND dea.date=vac.date
 WHERE dea.continent IS NOT NULL
 AND vac.new_vaccinations IS NOT NULL
 ORDER BY 2,3;
 
 
 SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
 SUM(vac.new_vaccinations)OVER(PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVacsinated
 FROM portfolio_project.covid_death dea
 JOIN portfolio_project.covid_vacsination vac
	ON dea.location=vac.location
    AND dea.date=vac.date
 WHERE dea.continent IS NOT NULL
 AND vac.new_vaccinations IS NOT NULL
 ORDER BY 2,3;
 
 -- ********************************************ACT
 WITH popvsvac (continent,location,date,population,new_vaccinations,RollingPeopleVacsinated)
AS
(SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
 SUM(vac.new_vaccinations)OVER(PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVacsinated
 FROM portfolio_project.covid_death dea
 JOIN portfolio_project.covid_vacsination vac
	ON dea.location=vac.location
    AND dea.date=vac.date
 WHERE dea.continent IS NOT NULL
 AND vac.new_vaccinations IS NOT NULL)
 SELECT *,(RollingPeopleVacsinated/population)*100 as vacinPercentage
 FROM popvsvac;
 
 
 
 -- ********temporary table*********
 DROP TABLE IF exists PercnetPopulationVaccinated;
 
 CREATE TEMPORARY TABLE PercnetPopulationVaccinated
 SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
 SUM(vac.new_vaccinations)OVER(PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVacsinated
 FROM portfolio_project.covid_death dea
 JOIN portfolio_project.covid_vacsination vac
	ON dea.location=vac.location
    AND dea.date=vac.date
 WHERE dea.continent IS NOT NULL
 AND vac.new_vaccinations IS NOT NULL
 ORDER BY 2,3;

 SELECT * ,(RollingPeopleVacsinated/population)*100 AS RollingPeopleVacsinated
 FROM PercnetPopulationVaccinated;
 
 
 -- Creating View to store data for later visualization
 
 create view PercnetPopulationVaccinated AS
  SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
 SUM(vac.new_vaccinations)OVER(PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVacsinated
 FROM portfolio_project.covid_death dea
 JOIN portfolio_project.covid_vacsination vac
	ON dea.location=vac.location
    AND dea.date=vac.date
 WHERE dea.continent IS NOT NULL
 AND vac.new_vaccinations IS NOT NULL
 ORDER BY 2,3;
 
 select * from PercnetPopulationVaccinated 
 