-- Процедура для переводу цельсію (дані в таблиці) в фаренгейт
DROP PROCEDURE IF EXISTS c2f(float);
CREATE OR REPLACE PROCEDURE c2f(INOUT x float)
LANGUAGE plpgsql
AS $$
  BEGIN
    x := (x * 9/5) + 32;
  END;
$$;