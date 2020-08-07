#!/bin/bash
echo "removing test cache"
rm -rf ./var/cache/test*
rm -rf ./var/cache/test_local*
echo "removing dev cache"
rm -rf ./var/cache/dev*
echo "removing app cache"
rm -rf ./app/cache/*
