use strict;
use warnings;
use 5.18.2;

use Test::Simple tests => 1;

use RT::Extension::RTBH qw(List);

print "Null Route Service URL: ";
my $url = <STDIN>;
chomp($url);

ok( length(${List($url)}{'success'}) > 0 );
