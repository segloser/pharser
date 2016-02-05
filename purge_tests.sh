#!/bin/bash
rm -r parsed
rm ./wgot/good/*
rm ./wgot/bad/*
rm bad_content_hashed.txt bulk.txt dict* match* good_content_hashed.txt ls_bad.txt ls_good.txt out2.txt output.txt urls_process.txt
cp ./forced_matches/* ./wgot/bad
