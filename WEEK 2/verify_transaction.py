from web3 import Web3
from eth_account import Account

w3 = Web3()
signed_transaction = input("Enter the signed transaction: ")
sender_addr = input("Enter Sender's Addr: ")

recovered_sender_addr = Account.recover_transaction(signed_transaction)
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" ")
if sender_addr.lower() == recovered_sender_addr.lower():
    print("Verified")
else:
    print("Invalid")
    
print(" ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")