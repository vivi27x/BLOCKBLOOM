from eth_account import Account
import secrets
priv = secrets.token_hex(32)
private_key = "0x" + priv
print ("Your Private Key :", private_key)
acct = Account.from_key(private_key)
print("Your EOA Address:", acct.address)