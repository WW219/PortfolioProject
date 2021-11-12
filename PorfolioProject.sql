--Select iso_code, MAX(CAST(total_deaths as int))
--from PortfolioProject..CovidDeaths
--where iso_code not like '%OWID%'
--group by iso_code

--Select location, total_deaths
--from PortfolioProject..CovidDeaths
--where CAST(total_deaths as int) = (Select MAX(CAST(total_deaths as int)) from PortfolioProject..CovidDeaths where iso_code not like '%OWID%')


--select location, date, total_deaths,total_cases,(total_deaths/total_cases) * 100 as DeathRate, population, (total_cases/population) * 100 as InfectionRate
--from PortfolioProject..CovidDeaths
--order by 1,2 

--select location, population, max(total_cases),max(total_cases/population)* 100 as InfectionRate
--from PortfolioProject..CovidDeaths
--group by location, population
--order by InfectionRate DESC

--select continent, sum(cast(total_deaths as int)) as TotalDeaths
--from PortfolioProject..CovidDeaths
--where continent is not null
--group by continent
--order by TotalDeaths DESC

--select location, max(cast(total_deaths as int)) as TotalDeaths
--from PortfolioProject..CovidDeaths
--where continent is null
--group by location
--order by TotalDeaths DESC

--select continent, sum(cast(total_deaths as int)) as TotalDeaths
--from PortfolioProject..CovidDeaths
--where continent is not null
--AND date = CONVERT(DATETIME, '2021-11-10', 102)
--group by continent
--order by TotalDeaths DESC


--select sum(cast(total_deaths as int)) as TotalDeaths
--from PortfolioProject..CovidDeaths
--where continent is not null
--AND date = CONVERT(DATETIME, '2021-11-10', 102)

--select date, sum(new_cases) as GlobleCases, sum(cast(new_deaths as int)) as GlobleDeaths, (sum(cast(new_deaths as int))/sum(new_cases)) * 100 as GlobleDeathRate
--from PortfolioProject..CovidDeaths
--where continent is not null
--group by date
--order by date


--with PeoVax (continent, location, date, polulation,newVax, totalVax)
--as
--(
--select dea.continent, dea.location, dea.date, dea.population, convert(float, vac.new_vaccinations) newVax, 
--sum(convert(float, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date)  totalVax
--from PortfolioProject..CovidDeaths dea
--join PortfolioProject..CovidVaccinations vac
--	on dea.location = vac.location
--	and dea.date = vac.date
--where dea.continent is not null
--)

--select *, (totalVax/polulation)* 100 as VaxperCapita
--from PeoVax


--create view  PeoVax as
--select dea.continent, dea.location, dea.date, dea.population, convert(float, vac.new_vaccinations) newVax, 
--sum(convert(float, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date)  totalVax
--from PortfolioProject..CovidDeaths dea
--join PortfolioProject..CovidVaccinations vac
--	on dea.location = vac.location
--	and dea.date = vac.date
--where dea.continent is not null


select * 
from PeoVax