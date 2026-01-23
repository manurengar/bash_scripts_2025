#!/bin/bash

# Read the encrypted token by providing the password on console
vim -es -c 'argdo %print' -c 'qa!' $1
