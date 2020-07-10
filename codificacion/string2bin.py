def string2bin(string):
    # Funcion que transforma un string a su representacion binaria en 8 bits
    binary = '';
    for char in string:
        # bin retorna la representacion binaria de un numero
        # ord retorna el codigo ascii de un string de un caracter
        bit = bin(ord(char)).replace('b', '');
        # Se agregan ceros a la izquierda para aquellos caracteres
        # cuya cadena binaria sea menor a ocho digitos
        dif = 8 - len(bit);
        if dif != 0:
            for i in range(dif):
                bit = '0' + bit;
        binary += bit;
    return binary;
