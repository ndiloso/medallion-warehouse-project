/*
==============================================
Create Database and Schemas
==============================================

Script purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  if the database exists, it is dropped and recreated.
  Additionally, the script sets up three schemas within the database:'bronze','silver', and gold.

Warning:
  Running the script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with caution.
  Also ensure you have proper backups running this script.
*/

USE master;
Go

--Drop and recreate the DataWarehouse database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

Go

--Create the 'DataWarehouse' database and the 'bronze', 'silver', and 'gold' schemas

CREATE DATABASE DataWarehouse;

Go

USE DataWarehouse;
Go

--Create the 'bronze', 'silver', and 'gold' schemas in the 'DataWarehouse' database

CREATE SCHEMA bronze;
Go

CREATE SCHEMA silver;
Go

CREATE SCHEMA gold;
Go
