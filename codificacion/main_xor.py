from xor_encode import xor_encode;
from xor_decode import xor_decode;
from dat_gen import dat_gen;

data = 'Mensaje codificado ultrasecreto';
key = '11110011';

encoded_message = xor_encode(data, key);

print(encoded_message);

decoded_message = xor_decode(encoded_message, key);

print(decoded_message);

dat_gen(encoded_message, "xor", "xor", key);
