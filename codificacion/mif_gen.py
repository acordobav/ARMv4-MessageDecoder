def mif_gen(encoded_message, algorithm, filename, key=None):
    """
    Funcion para almacenar el mensaje codificado en un archivo .mif
    :param encoded_message: Mensaje codificado, string donde cada
    caracter debe estar separado por un espacio en blanco
    :param algorithm: string que indica el algoritmo utilizado,
    "xor", "not" o cualquier otro para el corrimiento circular
    :param filename: nombre del archivo .mif
    :param key: string, en el caso del xor corresponde a la llave utilizada,
    en el caso del corrimiento circular a la cantidad de bits de la rotacion
    :return:
    """
    f = open(filename + '.mif', "w"); # Apertura del archivo .mif

    # Contenido inicial del archivo .mif
    initial_data = "WIDTH=8;\n" \
                   "DEPTH=256;\n" \
                   "\n" \
                   "ADDRESS_RADIX=HEX;\n" \
                   "DATA_RADIX=HEX;\n" \
                   "\n" \
                   "CONTENT BEGIN\n";
    f.write(initial_data);
    num_element = 1;

    # Escritura del algoritmo utilizado
    if algorithm == "xor":
        f.write("\t0   :   00;\n");
        data = hex(int(key, 2)).replace('0x', '');
        f.write("\t1   :   " + data + ";\n");
        num_element += 1;
    elif algorithm == "not":
        f.write("\t0   :   01;\n");
    else:
        f.write("\t0   :   03;\n");
        data = hex(int(key, 2)).replace('0x', '');
        f.write("\t1   :   " + data + ";\n");
        num_element += 1;

    # Escritura del mensaje codificado
    chars = encoded_message.split(' '); # Se obtiene cada caracter del mensaje
    chars.pop(); # Se elimina el ultimo elemento ya que es nulo

    for char in chars:
        el = hex(num_element).replace('0x', ''); # Numero de elemento
        data = hex(int(char, 2)).replace('0x', ''); # Dato que debe ser escrito
        f.write("\t" + el + "   :   " + data + ";\n");
        num_element += 1;

    # Contenido final del archivo .mif
    final_data = "\t" + hex(num_element).replace('0x', '') + "   :   FF;\n" \
                 "\t[" + hex(num_element+1).replace('0x', '') +"..0FF]  :   00;\n" \
                 "END;";
    f.write(final_data);
    f.close();
