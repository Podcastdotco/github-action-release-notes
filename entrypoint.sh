#!/bin/sh

if [[ -z "${TAG}" ]]; then TAG="${INPUT_TAG}"; fi
if [[ -z "${LOG_FORMAT}" ]]; then LOG_FORMAT="${INPUT_LOGFORMAT}"; fi
if [[ -z "${DATE_FORMAT}" ]]; then DATE_FORMAT="${INPUT_DATEFORMAT}"; fi

if [[ -z $(git tag --list) ]]; then
   echo "Repository do not have any tags"
   exit 1
fi

ls -l

if [[ -z "${TAG}" ]]; then
  TAG=$(git describe --abbrev=0 --tags)
fi

if [[ -z "${TAG}" ]]; then
  echo "The tag is empty"
  exit 1
fi

echo "tag is $TAG"
log=$(git log $TAG.. --pretty=format:"$LOG_FORMAT" --date=format:"$DATE_FORMAT")

echo "$log"
echo ::set-output name=log::"$log"
