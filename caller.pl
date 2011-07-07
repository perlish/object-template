#!/usr/bin/perl


use FFI::Library;

$lib = FFI::Library->new("print");
$fn = $lib->function("printstring", "cIp");
$fn->($ARGV[0]);

