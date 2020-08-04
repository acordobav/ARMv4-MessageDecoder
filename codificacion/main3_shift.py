from shift_encode import shift_encode
from dat_gen import dat_gen

data = 'Mensaje codificado ultrasecreto'
shift = '00000010'

encoded_message = shift_encode(data, shift)

print(encoded_message)

dat_gen(encoded_message, "shift", "shift", shift)
