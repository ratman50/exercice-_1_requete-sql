--Obtenir la liste des 10 villes les plus peuplées en 2012
select ville_nom,ville_population_2012 from villes order by ville_population_2012 desc limit 10; 

--Obtenir la liste des 50 villes ayant la plus faible superficie

select ville_nom, ville_surface from villes order by ville_surface limit 50;

--Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”

select departement_nom, departement_code from departement where departement_code like '97%';

--Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
select d.departement_nom, v.ville_nom, v.ville_population_2012 from departement d inner join villes v on d.departement_code=v.ville_departement order by v.ville_population_2012 desc limit 10;


--Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes

select d.departement_nom, d.departement_code,count(v.ville_code_commune) as nombre_de_commune  from departement  d
inner join villes v on d.departement_code=v.ville_departement group by d.departement_id order by nombre_de_commune desc; 

---Obtenir la liste des 10 plus grands départements, en terme de superficie
select d.departement_nom, sum(v.ville_surface) as superficie from departement d inner join 
villes v on d.departement_code=v.ville_departement group by d.departement_nom order by superficie desc;

--Compter le nombre de villes dont le nom commence par “Saint”
select ville_nom_reel from villes where ville_nom_reel like 'Saint%';

--Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
select ville_nom_reel, count(ville_nom_reel) as nombre from villes group by ville_nom_reel 
having count(ville_nom_reel) > 1 order by nombre desc;

--Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne

select  ville_nom_reel,avg(ville_surface) from villes group by ville_nom_reel   having avg(ville_surface) > (select avg(ville_surface) from villes) ;

--Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
select d.departement_nom, v.ville_population_2012 from departement d inner join Villes v on d.departement_code=v.ville_departement
where  v.ville_population_2012 > 2000000;

--Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)
update villes set ville_nom  ='SAINT '|| substring(ville_nom from 7) where ville_nom like 'SAINT-%';

