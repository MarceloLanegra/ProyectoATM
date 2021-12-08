delete from  [dbo].[atms] 
DBCC CHECKIDENT ('atms', RESEED,0)
delete from  [dbo].[atm_types] 
DBCC CHECKIDENT ('atm_types', RESEED,0)
delete  from  [dbo].[atm_models] 
DBCC CHECKIDENT ('atm_models', RESEED,0)
delete from  [dbo].[atm_states] 
DBCC CHECKIDENT ('atm_states', RESEED,0)
delete from  [dbo].[atm_brands] 
DBCC CHECKIDENT ('atm_brands', RESEED,0)

delete from [locations]
DBCC CHECKIDENT ('locations', RESEED,0)
delete from location_owners
DBCC CHECKIDENT ('location_owners', RESEED,0)
delete from location_types
DBCC CHECKIDENT ('location_types', RESEED,0)

delete from districts
DBCC CHECKIDENT ('districts', RESEED,0)
delete from provinces
DBCC CHECKIDENT ('provinces', RESEED,0)
delete from departments
DBCC CHECKIDENT ('departments', RESEED,0)

