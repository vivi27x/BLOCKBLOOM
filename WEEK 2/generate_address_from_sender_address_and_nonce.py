import rlp
from web3 import Web3
from eth_utils import keccak
def generate_contract_address(sender: str, nonce: int) -> str:
    
    sender = Web3.to_checksum_address(sender)
    encoded = rlp.encode([bytes.fromhex(sender[2:]), nonce])
    contract_hash = keccak(encoded)
    contract_address = '0x' + contract_hash[-20:].hex()

    return contract_address

sender_address = input("Enter Sender Address : ")
transaction_nonce = int(input("Enter Nonce : "))

result_address = generate_contract_address(sender_address, transaction_nonce)
# Output the result
print(" ------------------------------------------------------------------ ")
print(f"Sender Address: {sender_address}")
print(f"Nonce: {transaction_nonce}")
print(f"Generated Contract Address: {result_address}")
print(" ------------------------------------------------------------------ ")
