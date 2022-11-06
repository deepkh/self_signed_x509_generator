#!/bin/bash
# Copyright (c) 2022 Gary Huang, deepkh@gmail.com, https://github.com/deepkh
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

source x509_cert_generator.sh

########################################################
# Please change the following information as you want
########################################################
ROOTCA_PREFIX="rootca"
ROOTCA_PASSWORD="12345678"
ROOTCA_CN="netsync.tv"
ROOTCA_PATH="./"
ROOTCA_EMAIL="deepkh@netsync.tv"

# Generate Self-Signed X.509 RootCA
root_ca() {
  _cert_rootca_gen \
      "${ROOTCA_PREFIX}" \
      "${ROOTCA_PASSWORD}" \
      "${ROOTCA_CN}" \
      "${ROOTCA_PATH}" \
      "${ROOTCA_EMAIL}" 
}

########################################################
# Please change the following information as you want
########################################################
LOCAL_SERVERCERT_PREFIX="my_server.com"
LOCAL_SERVERCERT_PASSWORD="12345678"
LOCAL_SERVERCERT_CN="my_server.com"
LOCAL_SERVERCERT_SAN="DNS:localhost,DNS:my_server.com,IP:127.0.0.1"
LOCAL_SERVERCERT_EMAIL="my_mail@my_server.com"

# Use 'Self-Signed X.509 RootCA' to sign server certs
server_cert() {
  _cert_servercert_gen_without_password \
      "${LOCAL_SERVERCERT_PREFIX}" \
      "${LOCAL_SERVERCERT_PASSWORD}" \
      "${LOCAL_SERVERCERT_CN}" \
      "${ROOTCA_PATH}" \
      "${LOCAL_SERVERCERT_SAN}" \
      "${LOCAL_SERVERCERT_EMAIL}" \
      "${ROOTCA_CN}" \
      "${ROOTCA_PREFIX}" \
      "${ROOTCA_PASSWORD}"
}

all() {
  root_ca
  server_cert
}

$@
