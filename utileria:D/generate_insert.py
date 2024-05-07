import mysql.connector

def ejecutar_procedimiento():
    # Conexión a la base de datos
    conn = mysql.connector.connect(
        host="3006",
        user="campus2023",
        password="campus2023",
        database="universidadDB"
    )
    
    # Crear un cursor
    cursor = conn.cursor()
    
    try:
        # Leer el archivo procedures.txt para obtener los nombres de los procedimientos almacenados
        with open('procedures.txt', 'r') as file:
            procedure_names = file.readlines()
        
        # Eliminar los saltos de línea al final de cada nombre de procedimiento
        procedure_names = [name.strip() for name in procedure_names]
        
        # Para cada nombre de procedimiento, ejecutar el procedimiento almacenado correspondiente
        for procedure_name in procedure_names:
            cursor.callproc(procedure_name)
            
            # Hacer commit de los cambios
            conn.commit()
            
            # Obtener los comandos DDL
            cursor.execute("SELECT event_definition FROM information_schema.events WHERE event_time > NOW() - INTERVAL 1 MINUTE")
            ddl_commands = cursor.fetchall()
            
            # Imprimir los comandos DDL
            print(f"DDL Commands for {procedure_name}:")
            for ddl_command in ddl_commands:
                print(ddl_command[0])
            print()  # Imprimir una línea en blanco entre los comandos de diferentes procedimientos
            
    except mysql.connector.Error as err:
        print("Error al ejecutar los procedimientos almacenados:", err)
    finally:
        # Cerrar el cursor y la conexión
        cursor.close()
        conn.close()

# Llamar a la función para ejecutar los procedimientos almacenados
ejecutar_procedimiento()
