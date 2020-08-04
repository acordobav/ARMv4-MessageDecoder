def dat_gen(encoded_message, algorithm, filename, key=None):
    """
    Funcion para almacenar el mensaje codificado en un archivo .dat
    :param encoded_message: Mensaje codificado, string donde cada
    caracter debe estar separado por un espacio en blanco
    :param algorithm: string que indica el algoritmo utilizado,
    "xor", "not" o cualquier otro para el corrimiento circular
    :param filename: nombre del archivo .mif
    :param key: string, en el caso del xor corresponde a la llave utilizada,
    en el caso del corrimiento circular a la cantidad de bits de la rotacion
    :return:
    """
    f = open(filename + '.dat', "w"); # Apertura del archivo .dat

    # Escritura del algoritmo utilizado
    if algorithm == "xor":
        f.write("00\n");
        data = hex(int(key, 2)).replace('0x', '');
        f.write(data + "\n");
    elif algorithm == "not":
        f.write("01\n");
    else:
        f.write("03\n");
        data = hex(int(key, 2)).replace('0x', '');
        f.write(data + "\n");

    # Escritura del mensaje codificado
    chars = encoded_message.split(' '); # Se obtiene cada caracter del mensaje
    chars.pop(); # Se elimina el ultimo elemento ya que es nulo

    for char in chars:
        data = hex(int(char, 2)).replace('0x', ''); # Dato que debe ser escrito
        f.write(data + "\n");

    # Escritura del caracter de finalizacion
    f.write("ff\n");
    f.close();
