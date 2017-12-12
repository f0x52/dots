#!/bin/bash

while read x
do
	eval $x&
done
