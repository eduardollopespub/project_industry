drop database if exists db_dotz;

create database if not exists db_dotz default character set utf8;

use db_dotz;

-- Create staging area:

create table stg_price_quote 
(
	tube_assembly_id 	varchar(9),
	supplier 			varchar(9),
	quote_date 			date,
	annual_usage 		int,
	min_order_quantity 	int,
	bracket_pricing 	varchar(3),
	quantity 			int,
	cost 				decimal(10,2)
);


create table stg_comp_boss
(
	component_id 		varchar(6),
	component_type_id 	varchar(6),
	item_type 			varchar(4),
	connection_type_id 	varchar(6),
	outside_shape 		varchar(5),
	base_type 			varchar(12),
	height_over_tube 	numeric(10,2),
	bolt_pattern_long 	numeric(10,2),
	bolt_pattern_wide 	numeric(10,2),
	groove 				varchar(3),
	base_diameter 		numeric(5,2),
	shoulder_diameter 	numeric(5,2),
	unique_feature 		varchar(3),
	orientation 		varchar(3),
	weight 				numeric(5,3)
);


create table stg_bill_materials
(
	tube_assembly_id 	varchar(9),
	component_id_1 		varchar(6),
	quantity_1			int,
	component_id_2 		varchar(9),
	quantity_2 			int,
	component_id_3 		varchar(9),
	quantity_3 			int,
	component_id_4 		varchar(9),
	quantity_4 			int,
	component_id_5 		varchar(9),
	quantity_5 			int,
	component_id_6 		varchar(9),
	quantity_6 			int,
	component_id_7 		varchar(9),
	quantity_7 			int,
	component_id_8 		varchar(9),
	quantity_8 			int
);


-- Create dimension table:
create table d_tempo
(
	id_data 		date,
	mes		 		varchar(20),
	trimestre		int(1),
	ano				int(4),
	constraint pk_d_tempo primary key(id_data)
);

create table d_component
(
	id      			varchar(10),
	type_id 			varchar(10),
	item_type 			varchar(10),
	connection_type_id 	varchar(10),
	outside_shape 		varchar(50),
	base_type 			varchar(50),
	height_over_tube 	numeric(8,2),
	bolt_pattern_long 	numeric(8,2),
	bolt_pattern_wide 	numeric(8,2),
	groove 				varchar(3),
	base_diameter  		numeric(8,2),
	shoulder_diameter  	numeric(8,2),
	unique_feature 		varchar(3),
	orientation 		varchar(3),
	weight 				numeric(8,5),
	constraint pk_d_component primary key (id),
	index(id)
);


create table d_tube_assembly
(
    id 						int not null auto_increment,
    tube_assembly_id 		varchar(10),
    quantity 				int,
    component_id 			varchar(10),
    un_d_tube_assembly		varchar(40),
    constraint pk_d_tube_assembly primary key (id),
    constraint un_d_tube_assembly unique (tube_assembly_id, component_id),
    index(un_d_tube_assembly)
);
