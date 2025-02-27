from hashlib import sha256
import time

input_ = input("Enter something: ")
nonce = 0
threshold = 3

start_time = time.time()  # Start the timer
limit = 1e10 # keeping only 10 billion tries for now
while nonce < limit:
    found = True
    nonce_string = str(nonce)
    temp_input_ = input_ + nonce_string
    hash = sha256(temp_input_.encode("utf-8")).hexdigest()

    for i in range(threshold):
        if hash[i] != '0':
            found = False
            break

    if found:
        end_time = time.time()  # End the timer
        print("SHA-256 : " + hash + " and Nonce is : " + str(nonce))
        print(f"Time taken: {end_time - start_time:.6f} seconds")
        break
    else:
        nonce += 1

if not found:
    end_time = time.time()
    print("No valid nonce found within the given limit.")
    print(f"Time taken: {end_time - start_time:.6f} seconds")
