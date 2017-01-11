#! /usr/bin/perl
use strict;
use warnings;
use IO::File;

my %bad_parents;
my $pipe = IO::File->new("ps -ef |") || die $!;

while (my $line = <$pipe>) {
	if ($line =~ /^\S+\s+(\d+)\s+(\d+)\s+.*<defunct>/) {
	my ($pid, $ppid) = ($1,$2);
	print "Found zombie: $pid\n";
	$bad_parents{$ppid} = 1;
	print "\n\nMy Process ID :".@ppid."\n\n";
	}
}
$pipe->close;
while (my ($ppid,$val) = each %bad_parents) {
	print "Killing $ppid\n";
	#kill KILL=>$ppid;
} 