select *
from census..Data1
select *
from census..data2

--number of rows into our dataset
select count(*) from census..Data1
select count(*) from census..Data2

--calculate the data for jharkhand and bihar

select* from census..data1 
where state in ('Jharkhand','Bihar')

--population of india

select sum(Population) as tpop
from census..data2


--avg growth

select state, avg(growth)*100 avggrowth
from census..data1 group by state

--avg sex ratio

select state, round(avg(Sex_Ratio),0) avgratio
from census..data1 group by state 
order by avgratio desc

--average literacy rate
select state, round(avg(Literacy),0) avg_literacy_ratio
from census..data1 group by state 
order by avg_literacy_ratio desc


select state, round(avg(Literacy),0) avg_literacy_ratio
from census..data1 group by state 
having round(avg(literacy),0)>=75
order by avg_literacy_ratio desc 


--top 3 states highest growth rate
select top 3 state, avg(growth)*100 avggrowth
from census..data1 group by state order by avggrowth desc

--lowest 3 states showing lowest sex ratio
select top 3 state, round(avg(Sex_Ratio),0) avgratio
from census..data1 group by state 
order by avgratio asc


--top and bottom 3 states in literacy states
drop table if exists #topstates
create table #topstates
(state nvarchar(255),
topstates float

)
insert into #topstates
select  state, round(avg(Literacy),0) avg_literacy_rate
from census..data1 group by state 
order by avg_literacy_rate desc

select top 3*
from #topstates
order by #topstates.topstates asc

drop table if exists #bottomstates
create table #bottomstates
(state nvarchar(255),
bottomstates float

)
insert into #bottomstates
select  state, round(avg(Literacy),0) avg_literacy_rate
from census..data1 group by state 
order by avg_literacy_rate desc

select top 3*
from #bottomstates
order by #bottomstates.bottomstates desc



--filter data for all states with letter a
select*
from census..Data1 
where upper(state) like 'a%'

select distinct State
from census..Data1 
where lower(state) like 'a%' or lower(state) like 'h%' 













