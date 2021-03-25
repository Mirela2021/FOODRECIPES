


create database FOODRECIPES
use FOODRECIPES;
CREATE TABLE ListaProduse
(
IDProdus int identity (1,1),
DenumireProdus varchar(40),
UnitateMasura decimal (10,2),
);

alter table listaproduse
alter column unitatemasura varchar (20);

insert into ListaProduse (DenumireProdus, UnitateMasura)
values 
('ciuperci', 'bucati'),
('dovlecel', 'bucati'),
('morcovi', 'bucati'),
('ceapaverde','legatura'),
(' patrunjel','legatura'),
('marar', 'legatura'),
('cascaval','grame'),
('delaco', 'grame'),
('oua', 'bucati'),
('pesmet', 'grame'),
('sare', 'lingurite'),
('condimente', 'lingurite'),
('susan', 'lingurite')
;

create table ListaRetete
(
IDReteta int identity (100,1),
IDProdus int,
Cantitate decimal (10,2),
DescriereReteta varchar (500),
ComentariiSupl varchar(100)
);

insert into ListaRetete (IDProdus, Cantitate, DescriereReteta, ComentariiSupl)
Values
(2,
12,
'Se dau prin razatoare legumele (Robot razatoarea mica)se pune sarea peste ele si se lasa la scurs.
Dupa vreo 20 de minute le-am scurs prin sita.
Prajite la tigaie 4 min pe o parte, 4 pe cealata parte.
Daca nu s-au patruns de pus la cuptor 15 minute la 150 de grade.',
'NoCommentYet'
);
use foodrecipes;
alter table listaretete
add Reteta varchar (40);

insert into listaretete (Reteta)
values ('ChifteluteVegetale');

create table ReteteProduse
(
ID int identity (1,1),
IDProdus int,
IDReteta int,
Cantitate decimal (10,2)
)
;

delete from listaproduse where idprodus=3;

insert into ReteteProduse (IDProdus, IDReteta, Cantitate)
values
(2,100,12),
(4,100,1)
;

insert into ReteteProduse (IDProdus, IDReteta, Cantitate)
values
(5,100,3.5),
(6,100,1),
(7,100,1),
(8,100,1),
(9,100,110),
(10,100,150),
(11,100,3),
(12,100,50),
(13,100,2.5),
(14,100,2),
(15,100,2)
;


insert into ListaProduse (DenumireProdus, UnitateMasura)
values
('ardei', 'bucati'),
('ulei', 'lingurite')
;

insert into ListaRetete (reteta, ComentariiSupl)
values
('CiuperciUmplute', 'NoCommentYet')
;

insert into ReteteProduse (IDProdus, IDReteta, Cantitate)
values
(16,101,8),
(2,101,8),
(5,101,1),
(6,101,3),
(17,101,5),
(4,101,1)
;

update ListaProduse
set UnitateMasura='linguri' where IDprodus=17;

update ReteteProduse set Cantitate=1 where ID=14;

create view ViewRetete
as

( 
select 
ListaRetete.Reteta, 
ListaRetete.DescriereReteta, 
ListaRetete.IDReteta,

ListaProduse.DenumireProdus,
ListaProduse.IDProdus,
ListaProduse.UnitateMasura,

ReteteProduse.Cantitate

from ListaRetete
inner join ReteteProduse on ListaRetete.IDReteta=ReteteProduse.IDReteta
inner join ListaProduse on ReteteProduse.IDProdus=ListaProduse.IDProdus
)
;


create view ViewALLRetete
as

( 
select 
ListaRetete.Reteta, 
ListaRetete.DescriereReteta, 
ListaRetete.IDReteta,

ListaProduse.DenumireProdus,
ListaProduse.IDProdus,
ListaProduse.UnitateMasura,

ReteteProduse.Cantitate

from ListaRetete
FULL OUTER join ReteteProduse on ListaRetete.IDReteta=ReteteProduse.IDReteta
FULL OUTER JOIN ListaProduse on ReteteProduse.IDProdus=ListaProduse.IDProdus
)
;

alter table listaretete
add constraint Cstr_ComentariiSupl Default 'NoCommentYet' for ComentariiSupl;

insert into ListaProduse (DenumireProdus, UnitateMasura)
values
('cartofi', 'bucati'),
('ceapa', 'bucati'),
('telinaverde', 'legatura'),
('sare', 'lingurite'),
('condimente', 'lingurite'),
('uleibunica', 'linguri'),
('uleimasline', 'linguri'),
('piper', 'praf')
;

insert into ListaRetete (Reteta, DescriereReteta)
values
(
'SupaCremaLegume',
'
Apa 2 US. !Produsele se fac la robot.
'
)
;

insert into ReteteProduse
(IDProdus, IDReteta, Cantitate)
values
('5','102', '3'),
('16','102', '5'),
('19','102', '5'),
('20','102', '4'),
('2','102', '14'),
('21','102', '1'),
('13','102', '2.5'),
('23','102', '4'),
('24','102', '3'),
('25','102', '2'),
('26','102', '1')
;


insert into ListaProduse(DenumireProdus, UnitateMasura)
values
('castraveti mici','bucati'),
('castraveti mari','bucati'),
('rosii','grame'),
('danish','pachet'),
('delaco','pachet'),
('salata', 'bucata'),
('lamaie', 'bucati'),
('avocado','bucati'),
('paine','bucati'),
('mere','bucati'),
('cascaval','grame'),
('pomelo','bucati'),
('masline','burcane'),
('unt','pachet'),
('fistic','pachet'),
('pasta de dinti','pachet'),
('muschiulet porc','grame'),
('muschiulet vita','grame'),
('ceafa','grame'),
('lapte','litru'),
('curmale','pachet'),
('cartofidulci','bucati'),
('sparanghel','legatura'),
('vin','sticle'),
('periute dinti','bucati'),
('mozarella','pachet'),
('peste','pachet'),
('banane','bucati'),
('clementine','bucati'),
('ficatei','pachet'),
('sucmere','litru'),
('salam','pachet'),
('sunca','pachet'),
('Pulpe pui','pachet'),
('Sapun lichid','bucati'),
('oua','carton'),
('periuta','bucati'),
('iaurt de baut','bucati'),
('iaurt grecesc','bucati'),
('crema corp','bucati'),
('caju','pachet'),
('brocoli','bucati'),
('vanata','bucati'),
('miere','borcan'),
('haloumi','pachet'),
('macaroane','pachet'),
('guma airwaves','bucati'),
('bere','doza'),
('lichior','sticla')
;


use FOODRECIPES;
insert into ListaProduse(DenumireProdus, UnitateMasura)
values
('periuta', 'bucati'),
('sampon', 'bucati'),
('rolehartie', 'set'),
('servetele', 'bucata'),
('bulion', 'bucata'),
('betigase ureche', 'set'),
('gel dus', 'bucata'),
('miere', 'borcan'),
('apa de gura', 'sticla'),
('ciocolata', 'bucata'),
('spirt', 'sticla'),
('cous cous', 'pachet'),
('hartie igenica', 'set'),
('curmale', 'pachet'),
('faina', 'pachet'),
('fistic', 'pachet'),
('balsam antibacterian', 'sticla'),
('detergent rufe', 'pachet'),
('pur', 'sticla'),
('Cereale ','pachet'),
('Alune','pachet'),
('Spaghetti','pachet'),
('Duck wc ','bucata'),
('Pronto','bucata'),
('Orez ','pachet'),
('Coriandru','pachet'),
('saci de gunoi ','set'),
('dezinfectant buc?t?rie','bucata'),
('Fidea ','pachet'),
('Zahar','pachet'),
('Unt de arahide','pachet'),
('Suc de portocale ','sticla'),
('Gris ','pachet'),
('Cif','bucata'),
('Susan','pachet'),
('Tagliatele ','pachet'),
('Dero ','pachet'),
('Lavete ','set'),
('Migdale ','pachet'),
('Gem','borcan'),
('Malai','pachet'),
('Praf de copt','pachet'),
('Lichior','sticla'),
('Otet ','sticla'),
('Pop corn','pachet'),
('Cacao ','pachet'),
('Verdeturi','pachet'),
('Bureti vase','set'),
('Burete de baie','bucata'),
('Curry ','pachet')
;


use FOODRECIPES;
create table CategorieProdus
(
DenumireCategorie varchar (20),
IDCategorie int primary key identity (1,1), 
OrdineCategorie int
);

alter table categorieprodus
add idprodus varchar (20);


alter table LISTAproduse
add idcategorie int ;



--select toate produsele din retete: supacrema,salata, ciuperciumplute
-- grup dupa produs, unitatemasura si sum cantitate

select DENUMIRECATEGORIE,ORDINECATEGORIE, DenumireProdus, sum(Cantitate), UnitateMasura 
from ViewRetete where IDReteta in (101, 102, 103)
group by DENUMIRECATEGORIE, ORDINECATEGORIE, DenumireProdus, UnitateMasura
order by ORDINECATEGORIE, DenumireProdus asc;


UPDATE ListaProduse
SET[idcategorie]=[idcategorie]+44;


select 
ListaProduse.DenumireProdus,
ListaProduse.UnitateMasura,
Sum(ReteteProduse.Cantitate)as CantitateTotalaProduse,

string_agg(reteta,' ') as DescriereRetete,

CategorieProdus.DenumireCategorie,
CategorieProdus.OrdineCategorie


from ListaProduse 
inner join ReteteProduse on ReteteProduse.IDProdus=ListaProduse.IDProdus
inner join ListaRetete on ReteteProduse.IDReteta=ListaRetete.IDReteta
inner join CategorieProdus on ListaProduse.IDCategorie=CategorieProdus.IDCategorie
group by 
DenumireProdus,
UnitateMasura,
CategorieProdus.DenumireCategorie,
CategorieProdus.OrdineCategorie
order by OrdineCategorie asc;

------Afisare Retete cu Cantitate

select 
ListaProduse.DenumireProdus,
ListaProduse.UnitateMasura,
Sum(ReteteProduse.Cantitate)as CantitateTotalaProduse,

string_agg(concat(reteta,'(',Cantitate, ')'),'  ') as DescriereRetete,

CategorieProdus.DenumireCategorie,
CategorieProdus.OrdineCategorie


from ListaProduse 
inner join ReteteProduse on ReteteProduse.IDProdus=ListaProduse.IDProdus
inner join ListaRetete on ReteteProduse.IDReteta=ListaRetete.IDReteta
inner join CategorieProdus on ListaProduse.IDCategorie=CategorieProdus.IDCategorie
group by 
DenumireProdus,
UnitateMasura,
CategorieProdus.DenumireCategorie,
CategorieProdus.OrdineCategorie
order by OrdineCategorie asc;


select DENUMIRECATEGORIE,ORDINECATEGORIE, DenumireProdus, sum(Cantitate), UnitateMasura 
from ViewRetete where IDReteta in (101, 102, 103)
group by DENUMIRECATEGORIE, ORDINECATEGORIE, DenumireProdus, UnitateMasura
order by ORDINECATEGORIE, DenumireProdus asc;


--afisare ReteteSupaLegume+GarnituraCartofi+SalataSapt+Produse necesare
use FOODRECIPES;
select 
DenumireProdus, idPRODUS,
Sum(Cantitate)as CantitateTotalaProduse,
string_agg(concat(reteta, '(', cantitate, ')' ),'   ' ) as DetaliiReteteProduse

from  ViewALLRetete WHERE IDReteta IN (102,103,105) OR IDprodus in (74,107,51,77,35,67,73,80,96,100,125,127,128,79,102,9,30,31,46,126,33,34,55,54)
group by DenumireProdus, DenumireCategorie,OrdineCategorie, IDProdus
Order by OrdineCategorie asc, DenumireProdus asc;

select denumireprodus, IDProdus from ListaProduse where IDCategorie in (49);
--LEGUME	  45	LACTATE	  46	CARNE	  47	BAUTURI	  48	BACANIE	  49	COSMETICE 50	CURATENIE 51	

alter table listaproduse
add constraint ProdusUnic unique (DenumireProdus);

select * from ListaProduse
order by denumireprodus asc;

alter table reteteproduse
add constraint FK_ReteteProduse_LP_IDProdus 
FOREIGN KEY (IdProdus)
references ListaProduse (idProdus);

ALTER TABLE RETETEPRODUSE
ADD CONSTRAINT FK_ReteteProduse_LP_IDRetete
FOREIGN KEY (IDRETETA)
REFERENCES ListaRetete (idReteta);

select* from ReteteProduse where IDProdus not in (select IDprodus from ListaProduse);

use FOODRECIPES;
select * from ViewRetete where DenumireProdus='piper';