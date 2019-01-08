#!/bin/bash
set -e
READTERACTIVE_DIR=$1
if [[ -z "$READTERACTIVE_DIR" ]]; then
  echo "./publish.sh READTERACTIVE_DIR"
  echo "Missing READTERACTIVE_DIR parameter"
else
  CURRENT_DIR=$(pwd)
  echo "cd $READTERACTIVE_DIR"
  cd $READTERACTIVE_DIR
  make html BOOK=apestosos-experimentos
  echo "cd $CURRENT_DIR"
  cd $CURRENT_DIR
  echo "Copy apestosos-experimentos.html -> index.html"
  cp apestosos-experimentos/apestosos-experimentos.html index.html
  echo "Git commit & push"
  git add -A
  git commit -m "Update book"
  git push
fi