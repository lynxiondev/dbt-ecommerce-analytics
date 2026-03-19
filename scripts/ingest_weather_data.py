import pandas as pd
from google.cloud import bigquery
import datetime

# 1. Configuración: ¿A dónde mandamos los datos?
# CAMBIÁ 'tu-proyecto-id' por el ID de tu proyecto de GCP
# Reemplazá 'tu-proyecto-id' por lo que te salió en el comando anterior
project_id = 'mi-primer-laboratorio-data' 
client = bigquery.Client(project=project_id)

# Y asegurate de que table_id use esa misma variable
table_id = f"{project_id}.raw_external_data.daily_weather"

# 2. Simulación de Ingesta (Lo que haría una API)
# Creamos datos de clima para Carhué
data = [
    {"date": "2026-03-18", "temp_max": 28, "condition": "Sunny", "location": "Carhue"},
    {"date": "2026-03-19", "temp_max": 24, "condition": "Rainy", "location": "Carhue"},
]

# Convertimos a un DataFrame (una tabla en memoria de Python)
df = pd.DataFrame(data)
df['date'] = pd.to_datetime(df['date']).dt.date

# 3. FinOps & Calidad: Configuración de carga
job_config = bigquery.LoadJobConfig(
    # 'WRITE_TRUNCATE' borra y pisa (más barato en pruebas)
    # 'WRITE_APPEND' agrega al final (lo que harías en producción)
    write_disposition="WRITE_TRUNCATE",
)

print(f"🚀 Iniciando ingesta de {len(df)} filas a BigQuery...")

# 4. El "Disparo" a la Nube
job = client.load_table_from_dataframe(df, table_id, job_config=job_config)
job.result()  # Esperamos a que termine

print(f"✅ ¡Éxito! Los datos ya están en la tabla: {table_id}")   