WALLET_PATH='/home/oracle/clouddemo/wallet'
orapki wallet create -wallet $WALLET_PATH -pwd Enk1tec! -auto_login
orapki wallet add -wallet $WALLET_PATH -trusted_cert -cert "$WALLET_PATH/acoem.enkitec.com" -pwd Enk1tec!
