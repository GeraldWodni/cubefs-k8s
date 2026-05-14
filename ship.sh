#!/bin/bash

LAST_TAG=$(git tag | tail -n 1)
PREFIX=$(echo $LAST_TAG | cut -d. -f1)
SUFFIX=$(echo $LAST_TAG | cut -d. -f2)

TAG=${PREFIX}.$((SUFFIX + 1))

echo $TAG
git tag $TAG
git push origin master --tags
