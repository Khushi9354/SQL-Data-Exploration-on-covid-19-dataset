SELECT * FROM coronaviruse.deaths
order by 1,2;

-- selcting data that we are going to be using"

select location , date, total_cases, new_cases, total_deaths, population
 FROM coronaviruse.deaths
 where total_cases is not null;

-- looking at total cases vs total deaths 
-- shows likelihood of dying if you contrast covid in your country

select location , date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
 FROM coronaviruse.deaths;
 
 -- looking at total cases vs population got infected
 
 select  location , date, total_cases, population, (total_cases/population)*100 as population_got_infected
 from coronaviruse.deaths
 where country = "afganistan"
 ORDER BY total_cases DESC;
 
-- looking at countries with highest infection rate compared to population
  
 select  location , max(total_deaths) 
 from coronaviruse.deaths
 group by location
 order by death_count desc;
 
 -- showing countries with highest death count per population
 
 select location, max(total_deaths) as death_count, max(total deaths/population)*100
 from coronaviruse.deaths
 group by location, population ;
 
 -- lets break things down by continent 
 
 select continent, max(cast(total_deaths as int)) as death_count
 from coronaviruse.deaths
 where continent is not null 
 group by continent
 order by death_count desc;
 
 -- global numbers on death count
 
 SELECT  sum(total_cases), sum(total_deaths),(sum(total_deaths)/sum(total_cases))*100 as death_count
 from coronaviruse.deaths
 WHERE CONTINENT IS NOT NULL;
 
 -- looking at total populations vs vaccinations
 -- joining table deaths and vaccinations 
 
select dea.continent, dea.date, dea.location , dea.population, vac.new_vaccinations
, sum( vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as vaccinated
 FROM coronaviruse.deaths as dea
JOIN coronaviruse.vaccinations as vac
on dea.location = vac.location
and dea.date = vac.date
and dea.continent = vac.continent
where dea.continent is not null;



SELECT SUM(NEW_CASES) AS TOTAL_CASES,  SUM(NEW_DEATHS) AS TOTAL_DEATHS,  sum(new_deaths)/sum(new_cases)*100 AS DEATH_PERCENTAGE
FROM CORONAVIRUSE.DEATHS
WHERE CONTINENT IS NOT NULL 
ORDER BY 1,2;

SELECT location, population, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as population_infected
FROM CORONAVIRUSE.DEATHS
group by location , population,date
order by population_infected desc;


 select  location , sum(total_deaths ) as total_death_count
 from coronaviruse.deaths
 WHERE CONTINENT IS NULL
 group by location
 order by total_death_count desc;
 

 
