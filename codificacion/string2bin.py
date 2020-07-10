def string2bin(string):
    # Funcion que transforma un string a su representacion binaria
    # bin retorna la representacion binaria de un numero
    # ord retorna el codigo ascii de un string de un caracter
    return ''.join(bin(ord(c)) for c in string).replace('b', '');
