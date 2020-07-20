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

def not_decode(dato):
    """
    Función que usa el cifrado not para desencriptar un string
    :param dato: string con el mensaje que debe ser descriptado
    :return: string con el resultado
    """
    decoded_data = '';
    cont = 0;
    words = dato.split(' ');
    
    for word in words:
        for bit in word:
            decoded_data += str(no(int(bit)));         
            cont += 1;
        cont = 0;
        
    return ''.join([chr(int(decoded_data[i:i+8], 2)) for i in range(0, len(decoded_data), 8)]);
