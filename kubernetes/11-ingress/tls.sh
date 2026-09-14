openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout tls.key \
    -out tls.crt \
    -subj '/CN=*.demo.com/O=fredericome' \
    -addext 'subjectAltName = DNS:*.demo.com'
 
openssl x509 -in tls.crt -text
 
kubectl create secret tls demo-domain-secret --key tls.key --cert tls.crt