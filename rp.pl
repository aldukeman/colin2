#!/usr/bin/perl -w
use File::Basename;

if ((scalar @ARGV) != 3) {
	print "Usage: rp <domain> <problem> <relaxed_plan>\n";
	exit(1);
}

$dir = dirname(__FILE__);
$dom = shift @ARGV;
$prob = shift @ARGV;
$rp = shift @ARGV;

if (!(-e $dom)) {
	print "Domain file $dom not found\n";
	exit(1);
}

if (!(-e $prob)) {
  print "Problem file $prob not found\n";
  exit(1);
}

exec("$dir/bin/colin-clp", "-x", "$rp", "$dom", "$prob")
