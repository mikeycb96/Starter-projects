SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM [Covid Project]..CovidDeaths
WHERE continent is not NULL
order by 1,2

-- Looking at Total Cases vs Total Deaths


-- Shows the likelihood of dying if you contract covid in your country
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases) *100 as DeathPercentage
FROM [Covid Project]..CovidDeaths
where [location] LIKE 'Japan'
and continent is not null
order by 1,2 


--Looking at Total Cases vs Population


--Shows what percentage of popualtion have contracted covid
SELECT Location, date, total_cases, population, (total_cases/population) *100 as CovidPercentage
FROM [Covid Project]..CovidDeaths
where [location] LIKE 'Japan'
and continent is not null
order by 1,2 


--Looking at countries with highest infection rate compared to population


SELECT Location, Max(total_cases) as HighestInfectionCount, population, Max((total_cases/population)) *100 as PercentPopulationInfected
FROM [Covid Project]..CovidDeaths
--where [location] LIKE 'Japan'
--and contintent is not null
Group by LOCATION, population
order by PercentPopulationInfected DESC



--Looking at countries with Highest Death Count per Population

SELECT Location, Max(total_deaths) as TotalDeathCount
FROM [Covid Project]..CovidDeaths
Where continent is not null
Group by LOCATION 
Order BY TotalDeathCount DESC

--Death Count by Continent


SELECT continent, Max(total_deaths) as TotalDeathCount
FROM [Covid Project]..CovidDeaths
Where continent is not null
Group by [continent]
Order BY TotalDeathCount DESC


--Death Count by Continent and Economic groups


SELECT location, Max(total_deaths) as TotalDeathCount
FROM [Covid Project]..CovidDeaths
Where continent is null
Group by [location]
Order BY TotalDeathCount DESC


-- Global Numbers

SELECT date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases) *100 as DeathPercentage
FROM [Covid Project]..CovidDeaths
--where [location] LIKE 'Japan'
WHERE continent is not null
GROUP by [date]
order by 1,2 


--Looking at Total Population vs Vaccinations

SELECT dea.continent, dea.[location], dea.[date], dea.population, vac. new_vaccinations
, SUM(Cast(vac.new_vaccinations as bigint)) OVER (PARTITION BY dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/dea.population)*100
FROM [Covid Project]..CovidDeaths dea
JOIN [Covid Project]..CovidVaccinations vac
On dea.location = vac.[location]
and dea.date = vac.[date]
where dea.continent is not null
order by 2,3

--USE CTE

With PopvsVac (Continent, Location, Date, Population,New_Vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.[location], dea.[date], dea.population, vac. new_vaccinations
, SUM(Cast(vac.new_vaccinations as bigint)) OVER (PARTITION BY dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/dea.population)*100
FROM [Covid Project]..CovidDeaths dea
JOIN [Covid Project]..CovidVaccinations vac
On dea.location = vac.[location]
and dea.date = vac.[date]
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)
From PopvsVac


--Temp table

DROP TABLE if EXISTS #PercentPopulationVaccinated
Create TABLE #PercentPopulationVaccinated
(
Continent nvarchar(50),
Location nvarchar(50),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)


Insert into #PercentPopulationVaccinated
SELECT dea.continent, dea.[location], dea.[date], dea.population, vac. new_vaccinations
, SUM(Cast(vac.new_vaccinations as bigint)) OVER (PARTITION BY dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/dea.population)*100
FROM [Covid Project]..CovidDeaths dea
JOIN [Covid Project]..CovidVaccinations vac
On dea.location = vac.[location]
and dea.date = vac.[date]
--where dea.continent is not null
--order by 2,3


Select *, (RollingPeopleVaccinated/Population)
From #PercentPopulationVaccinated



--Creating view to store data for later visualisations

CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.[location], dea.[date], dea.population, vac. new_vaccinations
, SUM(Cast(vac.new_vaccinations as bigint)) OVER (PARTITION BY dea.location order by dea.location, 
dea.date) as RollingPeopleVaccinated
--(RollingPeopleVaccinated/dea.population)*100
FROM [Covid Project]..CovidDeaths dea
JOIN [Covid Project]..CovidVaccinations vac
On dea.location = vac.[location]
and dea.date = vac.[date]
where dea.continent is not null
--order by 2,3