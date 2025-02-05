
PG_HOST="$1"          # Dirección de tu servidor PostgreSQL
PG_USER="postgres"         # Tu nombre de usuario de PostgreSQL
PG_PORT="5432"               # Puerto de PostgreSQL (por defecto es 5432)
SQL_DIR="."/bases  # Directorio donde están tus archivos .sql

# Recorre cada archivo .sql en el directorio especificado
for SQL_FILE in $SQL_DIR/*.sql; do
    # Extrae el nombre de la base de datos desde el nombre del archivo (sin la extensión .sql)
    DB_NAME=$(basename "$SQL_FILE" .sql)

    # Crear la base de datos si no existe
    echo "Creando la base de datos $DB_NAME..."
    psql -h $PG_HOST -U $PG_USER -p $PG_PORT -c "CREATE DATABASE $DB_NAME;"

    # Ejecutar el archivo SQL en la base de datos correspondiente
    echo "Ejecutando el archivo $SQL_FILE en la base de datos $DB_NAME..."
    psql -h $PG_HOST -U $PG_USER -p $PG_PORT -d $DB_NAME -f $SQL_FILE

    # Verificar si la ejecución fue exitosa
    if [ $? -eq 0 ]; then
        echo "El archivo SQL $SQL_FILE se ejecutó correctamente en $DB_NAME."
    else
        echo "Hubo un error al ejecutar el archivo SQL $SQL_FILE en $DB_NAME."
    fi
done




