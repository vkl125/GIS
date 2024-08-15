
 DECLARE @pPKList NVARCHAR(MAX) = N'[{ "SRVY_UID":1234, "ASGN_STS":"test"}, {"SRVY_UID":234, "UPD_DT":"3-1-23"}]'
		SELECT [SRVY_UID]
				,[ASGN_STS]
				,[UPD_DT]
		INTO #pJso
		FROM
			OPENJSON(@pPKList)
			WITH
			(
				[SRVY_UID] int '$.SRVY_UID',
				[ASGN_STS] varchar(5) '$.ASGN_STS',
				[UPD_DT] datetime '$.UPD_DT'
			)
			select * from #pjso
--DECLARE @layout NVARCHAR(MAX) = N'[{ "SRVY_UID":1234, "locales":{"test":"en"}, "SRVY_UID":1234, "locales":"sn"}]'

--SELECT 
--*
--  --  a.id
--	 --,a.locales
--    --, [Locale] = b.value 
--FROM OPENJSON(@layout, '$') 
--WITH (
--    id INT '$.SRVY_UID',  
--    locales NVARCHAR(MAX) '$.locales' AS JSON
--) a
--CROSS APPLY OPENJSON (locales, '$.locales') as b

 --DECLARE @json NVARCHAR(1000)   
 --   SELECT @json =    
 --   N'{   
 --     "OrderHeader": [  
 --       {   
 --         "OrderID": 100,  
 --         "CustomerID": 2000,   
 --         "OrderDetail": [   
 --           {  
 --             "ProductID": 2000,   
 --             "UnitPrice": 350      
 --           },      
 --           {             
 --             "ProductID": 3000,   
 --             "UnitPrice": 450  
 --           },   
 --           {               
 --             "ProductID": 4000,  
 --             "UnitPrice": 550   
 --           }   
 --         ]   
 --       }    
 --     ]   
 --   }'   
        
 --   SELECT   
 --       JSON_Value (c.value, '$.OrderID') as OrderID,    
 --       JSON_Value (c.value, '$.CustomerID') as CustomerID,    
 --       JSON_Value (p.value, '$.ProductID') as ProductID,    
 --       JSON_Value (p.value, '$.UnitPrice') as UnitPrice   
         
 --   FROM OPENJSON (@json, '$.OrderHeader') as c   
 --   CROSS APPLY OPENJSON (c.value, '$.OrderDetail') as p  
--Declare @layout NVARCHAR(MAX) = N'
--    {
--        "Sections": [
--            {
--                "SectionName":"Section1",
--                "SectionOrder":1,
--                "Renders":[
--                    {
--                        "RenderName":"Render1",
--                        "RenderOrder":1,
--                        "Fields":[
--                            {
--                                "FieldName":"Field1",
--                                "FieldData":"Data1"
--                            },
--                            {
--                                "FieldName":"Field2",
--                                "FieldData":"Data2"
--                            }
--                        ]
--                    },
--                    {
--                        "RenderName":"Render2",
--                        "RenderOrder":2,
--                        "Fields":[
--                            {
--                                "FieldName":"Field1",
--                                "FieldData":"Data1"
--                            },
--                            {
--                                "FieldName":"Field2",
--                                "FieldData":"Data2"
--                            }
--                        ]
--                    } 
--                ]
--            },
--            {
--                "SectionName":"Section2",
--                "SectionOrder":2,
--                "Renders":[
--                    {
--                        "RenderName":"Render1",
--                        "RenderOrder":1,
--                        "Fields":[
--                            {
--                                "FieldName":"Field1",
--                                "FieldData":"Data1"
--                            }
--                        ]
--                    },
--                    {
--                        "RenderName":"Render2",
--                        "RenderOrder":2,
--                        "Fields":[
--                            {
--                                "FieldName":"Field1",
--                                "FieldData":"Data1"
--                            },
--                            {
--                                "FieldName":"Field2",
--                                "FieldData":"Data2"
--                            }
--                        ]
--                    } 
--                ]
--            }
--        ]
--    }
--'
--SELECT SectionName, SectionOrder, RenderName, RenderOrder, FieldName, FieldData
--FROM OPENJSON(@layout, '$.Sections') 
--WITH (
--    SectionName NVARCHAR(MAX) '$.SectionName',  
--    SectionOrder NVARCHAR(MAX) '$.SectionOrder', 
--    Renders NVARCHAR(MAX) '$.Renders' AS JSON
--)
--CROSS APPLY OPENJSON(Renders,'$')
--WITH (
--    RenderName NVARCHAR(MAX) '$.RenderName',  
--    RenderOrder NVARCHAR(MAX) '$.RenderOrder', 
--    Fields NVARCHAR(MAX) '$.Fields' AS JSON
--)
--CROSS APPLY OPENJSON(Fields,'$')
--WITH (
--    FieldName NVARCHAR(MAX) '$.FieldName',  
--    FieldData NVARCHAR(MAX) '$.FieldData'
--)
