#!/bin/sh

if [[ -z "${TAG}" ]]; then TAG="${INPUT_TAG}"; fi
if [[ -z "${LOG_FORMAT}" ]]; then LOG_FORMAT="${INPUT_LOGFORMAT}"; fi
if [[ -z "${DATE_FORMAT}" ]]; then DATE_FORMAT="${INPUT_DATEFORMAT}"; fi
ls -l
if [[ -z $(git tag --list) ]]; then
   echo "Repository do not have any tags"
   exit 1
fi

if [[ -z "${TAG}" ]]; then
  TAG=$(git describe --abbrev=0 --tags)
fi

if [[ -z "${TAG}" ]]; then
  echo "The tag is empty"
  exit 1
fi

echo "tag is $TAG"
LOG=$(git log $TAG.. --pretty=format:"$LOG_FORMAT" --date=format:"$DATE_FORMAT")
CHANGELOG="${LOG//'%'/'%25'}"
CHANGELOG="${CHANGELOG//$'\n'/'%0A'}"
CHANGELOG="${CHANGELOG//$'\r'/'%0D'}"

echo "$LOG"
echo ::set-output name=log::"$CHANGELOG"
