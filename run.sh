#!/bin/sh
rebar compile && deps/etest/bin/etest-runner
