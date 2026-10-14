#!/bin/bash

### To find matched number of letters in a given word

read x

grep -o "s" <<< "$x" | wc -l


