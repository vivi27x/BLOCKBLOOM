from web3 import Web3
print("----------------------WELCOME-------------------------")
Nonce = input("Enter Nonce : ")
Gas_limit = input("Enter Gas Limit : ")
Receiver_addr = input("Enter Receiver's address : ")
Amount = input("Enter amount of Ether to be sent : ")
Data = input("Enter any Data to be sent : ")
private_key = input("Enter Private key : ")

w3 = Web3()
transaction = {
    'nonce': int(Nonce),
    'gasPrice': 21000000000,  
    'gas': int(Gas_limit),  
    'to': Receiver_addr,
    'value': int(Amount),
    'data': Data,  
}
signed_txn = w3.eth.account.sign_transaction(transaction, private_key)
raw_signed_transaction = signed_txn.raw_transaction.hex()
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" ")
print("Signed transaction:", raw_signed_transaction)
print(" ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

