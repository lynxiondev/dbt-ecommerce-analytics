# E-commerce Data Platform (dbt + BigQuery)

Proyecto de Analytics Engineering basado en el dataset `thelook_ecommerce`. 

### Arquitectura de Datos
- **Staging**: Limpieza y normalización de fuentes crudas (incluye modelos **incrementales** para eventos).
- **Intermediate**: Transformaciones complejas y joins de entidades.
- **Marts**: Tablas de hechos (`fct_`) y dimensiones (`dim_`) listas para BI.

### Tech Stack
- **dbt-core** (v1.x)
- **BigQuery** como Data Warehouse.
- **dbt-utils** para generación de surrogate keys.
- **Macros personalizadas** para estandarización de moneda.

### Calidad de Datos
Implementación de tests de integridad referencial, unicidad y rangos de valores en todas las capas.   
