from not_encode import not_encode;
from not_decode import not_decode;
from mif_gen import mif_gen;

data = 'Mensaje codificado ultrasecreto';


encoded_message = not_encode(data);

print(encoded_message);

decoded_message = not_decode(encoded_message);

print(decoded_message);

mif_gen(encoded_message, "not", "not");
