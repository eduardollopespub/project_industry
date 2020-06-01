## Case Processo de Ingestão de dados Industriais.

Esse projeto tem como objetivo criar um pipeline de dados fazendo a leitura de um arquivo .csv, realizando transformações nos dados, disponibilizando para um DW (MySQL), e por fim tomar decisões através de indicadores construidos em Power BI.

## Arquitetura Proposta
* Data source (.csv)
* Pentaho Data Integration - PDI (Orquestrador)
* Procedures para Transformações / Insert DW / Update DW
* Microsoft Power BI para construção do Dashboard.

## Preparando o ambiente:
1. Download do [PDI](https://sourceforge.net/projects/pentaho/files/Data%20Integration/).

## Execução do job:
1. Crie o BD executando o [db_schema_dotz.sql](sql/db_schema_dotz.sql) utilizando o MySQL.

2. Na primeira vez, executar o script de criação da dimensão [d_tempo](job_pentaho/TRF_INGEST_D_TEMPO.ktr)
![TRF_INGEST_D_TEMPO](/image/TRF_INGEST_D_TEMPO.JPG?raw=true "Optional Title")

3. Criar as procedures no banco:
    - [USP_DimIU_Component](sql/USP_DimIU_Component.txt)
    - [USP_DimIU_TubeAssembly](sql/USP_DimIU_TubeAssembly.txt)
    - [USP_FatoPriceQuote](sql/USP_FatoPriceQuote.txt)

4. Executar o script job master [JOB_MASTER_INDUSTRY](job_pentaho/JOB_MASTER_INDUSTRY.kjb)
![JOB_MASTER_INDUSTRY](/image/JOB_MASTER_INDUSTRY.JPG?raw=true "Optional Title")
  
## Schema db_dotz:
![modelo-logico](/image/modelo-logico.JPG?raw=true "Optional Title")
Obs: O dump do banco pode ser encontrado na pasta [sql](sql/dump_Cloud_SQL_Export)

## Dashboard Power BI:
![resume_industry](/image/resume_industry.JPG?raw=true "Optional Title")

O arquivo de desenvolvimento pode ser encontrado na seção [dashboard](dashboard/resume_industry.pbix)

## Melhorias:
Sugestão de melhorias:

* Criar uma imagem docker para execução do projeto.
* Substituir o PDI para utilização do DataFlow.
* Criar um script em Python para rodar no lugar das Procedures, de modo que faça as alterações proposta nesse projeto.
