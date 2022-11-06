# Self-Signed X.509 Generator

Is it difficult to generate self-signed x509 certificate from openssl command line ? 

Here we are provide some help scripts for that purposes of 

"1 min to generate Self-Signed Root CA and Server Certs witin 2 steps"

### Generte the 'Self-Signed Root CA'

Please change the following infomration as you want from top of `build.sh`

```sh
ROOTCA_PREFIX="rootca"
ROOTCA_PASSWORD="12345678"
ROOTCA_CN="netsync.tv"
ROOTCA_PATH="./"
ROOTCA_EMAIL="deepkh@netsync.tv"
```
We could use the following command to generate ca by

```sh
./build.sh root_ca
```

Than we got `rootca.crt` for cert and `rootca.key` for cert private key in the folder.

### Generte the 'Self-Signed Server Certificate'

Please change the following infomration as you want from middle of `build.sh`

```sh
LOCAL_SERVERCERT_PREFIX="my_server.com"
LOCAL_SERVERCERT_PASSWORD="12345678"
LOCAL_SERVERCERT_CN="my_server.com"
LOCAL_SERVERCERT_SAN="DNS:localhost,DNS:my_server.com,IP:127.0.0.1"
LOCAL_SERVERCERT_EMAIL="my_mail@my_server.com"
```

After 'Self-Signed Root CA' succeed, than we could use the 'Self-Signed Root CA' to generate the server certs by 

```sh
./build.sh server_cert
```

Than we got `my_server.com.crt` for cert public key and `my_server.com.key` for cert private key in the folder.

Enjoy!


