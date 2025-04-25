#!/usr/bin/env bash

emacs -Q --script build-site.el
ln -sf public/* ./
