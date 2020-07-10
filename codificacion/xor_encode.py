from string2bin import string2bin;


def xor_encode(data, key):
    """
    Funcion que utiliza el cifrado xor para encriptar/desencriptar un string
    :param data: string con la informacion que debe ser escriptada/desencriptada
    :param key: string con la llave que debe utilizar el cifrado
    :return: string con el resultado del algoritmo
    """
    encoded_data = '';
    binary_data = string2bin(data); # Representacion binaria del mensaje
    key_bit = 0;
    # Se recorre cada bit de la cadena binaria y se aplica el algoritmo
    for bit in binary_data:
        encoded_data += str(int(bit) ^ int(key[key_bit]));
        key_bit += 1;
        if key_bit > 7:
            key_bit = 0;
            encoded_data += ' ';
    return encoded_data;
