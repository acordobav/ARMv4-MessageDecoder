def xor_decode(data, key):
    decoded_data = '';
    key_bit = 0;
    words = data.split(' ');
    for word in words:
        for bit in word:
            decoded_data += str(int(bit) ^ int(key[key_bit]));
            key_bit += 1;
        key_bit = 0;
    return ''.join([chr(int(decoded_data[i:i+8], 2)) for i in range(0, len(decoded_data), 8)]);
