
SELECT 
    
    (10 + 5) * 2 / (3 - 1) % 4 AS CalculationResult, 
    (@MyVar = 10 AND 5 < 10 OR 20 > 15) AS LogicalTest,
    (2 | 1 & ~4 ^ 8) AS BitwiseResult
FROM 
    sys.objects  -- A system reserved word
WHERE 
    name LIKE N'obj%' AND type IN ('U', 'V')
;



DECLARE @x_int_val INT = 100;
DECLARE @table_name NVARCHAR(50) = 'Products';
DECLARE @y_float_val DECIMAL(5, 2) = 45.67;


SELECT [USER], [ORDER], [SELECT] 
FROM 
    [dbo].@table_name
WHERE 
    [ID] = @x_int_val AND [Price] >= @@SPID 
;



SELECT 
    -- Integers
    12345 AS SimpleInt,
    +987 AS PositiveInt,
    -654 AS NegativeInt,
    0 AS Zero,
    
   
    1.2345 AS SimpleFloat,
    -54.321E+2 AS SciNotation, 
    .001 AS LeadingDotFloat,
    2. AS TrailingDotFloat,
    
    
    TRUE AS BoolTrue,
    FALSE AS BoolFalse,
    1 AS OneForTrue,
    0 AS ZeroForFalse
;




DECLARE @msg VARCHAR(50);
SET @msg = 'It''s a difficult day for the Lexer.\
This line should be concatenated.';

SELECT 
    
    'Test String with an ''apostrophe''.' AS QuotedString, 
    
   
    0xAA\
BBCCDD AS ConcatenatedHex,
    
   
    0b10101010 AS BinaryBit,
    
   
    '' AS EmptyString
;


-- 8. Multi Line Comment (Testing nesting and termination)
/*
This is the start of a complex multi-line comment block.
The lexer must ensure it finds the final terminator.

/* This is a nested comment inside the main block.
    The lexer should not terminate the outer comment here. 
*/

Final part of the comment.
*/
SELECT 
    'Lexer Test Complete' AS Status;
    