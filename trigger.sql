CREATE OR REPLACE FUNCTION record_datetime_now() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
 IF NEW."year" IS NULL THEN 
 	NEW."year" = EXTRACT(YEAR FROM NOW())::int;
 END IF;
 	
 RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS record_datetime_now ON public.records;
CREATE TRIGGER record_datetime_now
BEFORE INSERT ON public.records 
FOR EACH ROW 
EXECUTE FUNCTION public.record_datetime_now();