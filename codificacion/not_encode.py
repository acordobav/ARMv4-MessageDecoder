from string2bin import string2bin as st2b;


def no(bit):
    """
    Función que realiza un cambio not al valor de entrada
    :param bit: int al que se le aplicará not
    :return: int del resultado
    """
    if bit == 0:
        return 1
    else:
        return 0


def not_encode(dato):
    """
    Función que usa el cifrado not para encriptar un string
    :param dato: string con el mensaje que debe ser escriptado
    :return: string con el resultado
    """
    encoded_data = '';
    bin_data = st2b(dato);
    cont = 0;
    for bit in bin_data:
        encoded_data += str(no(int(bit)));
        cont += 1;
        if cont > 7:
            cont = 0;
            encoded_data += ' ';
    return encoded_data;
