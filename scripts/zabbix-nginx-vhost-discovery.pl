#!/usr/bin/perl

use strict;

my $first = 1;

my $num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "E: missing argument log_dir\n";
    exit 2;
}

my $log_dir=$ARGV[0];

print "{\n";
print "\t\"data\":[\n\n";

opendir(my $dh, $log_dir) || die("E: unable to open log_dir\n");

while(my $file = readdir $dh) {

    if ($file =~ m/^.*\.access\.zabbix\.log$/){

        $file =~ s/\.access\.zabbix\.log//g;

        print ",\n" if not $first;
        $first = 0;

        print "\t{\n";
        print "\t\t\"{#NAME}\":\"" . $file . "\"\n";
        print "\t}";
    }
}

closedir $dh;

print "\n\t]\n";
print "}\n";

exit 0
