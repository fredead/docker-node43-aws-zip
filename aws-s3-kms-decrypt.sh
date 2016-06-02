#!/bin/sh

CMD=`basename $0`
TMPFILE=`mktemp /tmp/${CMD}.XXXXXX` || exit 1

aws s3 cp $1 ${TMPFILE}
base64 --decode ${TMPFILE} > ${TMPFILE}.plain
aws kms decrypt --ciphertext-blob fileb://${TMPFILE}.plain --query Plaintext --output text | base64 --decode > $2
