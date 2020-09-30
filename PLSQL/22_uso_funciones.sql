select edad_actual(a.fechanaci), sysdate, a.* from empleados a
where edad_actual(a.fechanaci) >= 35;