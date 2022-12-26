-- Функція, яка видає міста в базі даних, за назвою країни
DROP FUNCTION IF EXISTS get_cities_by_country(varchar); 
CREATE OR REPLACE FUNCTION get_cities_by_country(country varchar) 
    RETURNS TABLE (city varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT c.name::varchar
		FROM public.city c
		INNER JOIN public.country cc
		ON c.id_country = cc.id 
		WHERE TRIM(cc.name) = TRIM(country);
END;
$$