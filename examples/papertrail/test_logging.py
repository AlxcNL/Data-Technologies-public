#!/usr/bin/env python

import logging
import os

message = "This is test8"

cmd = f"""curl --location --request POST {url}} \
 --header 'Content-Type: application/octet-stream' \
 --header 'Authorization: Bearer {token}' \
 --data-raw '{message}'"""

print(cmd)

os.system(str(cmd))

