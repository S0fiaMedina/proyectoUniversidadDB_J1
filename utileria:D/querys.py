def generar_llamada_procedimiento(procedimiento, valores):
    # Construir la llamada al procedimiento almacenado
    llamada = f"CALL {procedimiento}({valores});"
    return llamada

# Nombre del procedimiento almacenado
nombre_procedimiento = "DATA_SUBJECT"

# Abrir el archivo .txt y leer línea por línea
with open("query.txt", "r") as archivo_lectura, open("calling.txt", "a") as archivo_escritura:
    for linea in archivo_lectura:
        # Eliminar espacios en blanco al principio y al final de la línea
        linea = linea.strip()
        # Verificar si la línea no está vacía y comienza con "INSERT INTO"
        if linea and linea.startswith("INSERT INTO"):
            # Obtener los valores entre paréntesis
            valores = linea[linea.find("(")+1: linea.rfind(")")].strip()
            # Generar la llamada al procedimiento
            llamada_procedimiento = generar_llamada_procedimiento(nombre_procedimiento, valores)
            # Escribir la llamada al procedimiento en el archivo
            archivo_escritura.write(llamada_procedimiento + "\n")