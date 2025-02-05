PG_HOST="$1"          # Dirección de tu servidor PostgreSQL
PG_USER="postgres"         # Tu nombre de usuario de PostgreSQL
PG_PORT="5432"               # Puerto de PostgreSQL (por defecto es 5432)
SQL_DIR="./usuarios"
 psql -h $PG_HOST -U $PG_USER -p $PG_PORT -f $SQL_DIR/usuarios.sql