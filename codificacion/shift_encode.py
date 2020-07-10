from string2bin import string2bin
from right_rotate import right_rotate

def shift_encode(data, shift):

    encoded_data = '';
    data_string = '';
    binary_data = string2bin(data)

    shift = int(shift,2)

    data_bit = 0
    for bit in binary_data:
        data_string += bit
        data_bit += 1
        if data_bit > 7:
            data_bit = 0
            data_string += ' '

    print(data_string)

    data_list = list(data_string.split(" "))
    data_list.remove('')

    for data in data_list:
        data = list(data)
        data = right_rotate(data, shift)
        data = ''.join([str(elem) for elem in data])
        encoded_data += (data + ' ')

    return encoded_data
    
