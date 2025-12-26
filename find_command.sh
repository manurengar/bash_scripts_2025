#!/bin/bash
# This code uses find in conjuction with grep to find all files ending
# on sh on the etc folder
sudo find /etc -type f -executable -print0 | xargs -0 grep -E '\.sh$' > result.txt;

sudo find /etc -type f -executable -exec  grep -E '\.sh$' {} \; -print > result_2.txt
