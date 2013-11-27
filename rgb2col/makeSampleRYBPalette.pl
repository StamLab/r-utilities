#!/usr/bin/env perl 

use strict;
use warnings;
use Data::Dumper;

#
# To demonstrate the use of rgb2col() in R, we set up an input array of
# RGB values representing sequentially disparate colors, based on the RYB 
# color model. 
#
# cf. http://afriggeri.github.io/RYB/
#

my $rgb2colScript = "rgb2col.Rscript";

my @reds = qw(   84  25 255 191 127 255  20  89 255 153 148 255   0 127 255 255  41  51);
my @greens = qw( 47  96 127   0 211  63 131  11 255  75 175   0 168   0 255 127  95  23);
my @blues = qw( 140  25 127  63  25   0 102  63 127   0 204   0  51 127   0   0 153   0);

my $resultsColRef;

foreach my $colIdx (0..(scalar @reds - 1)) 
{
    my $red = $red[$colIdx];
    my $green = $greens[$colIdx];
    my $blue = $blues[$colIdx];

    my $convertCmd = "$rgb2colScript --red=$red --green=$green --blue=$blue";
    my $convertResult = `$convertCmd`;
    
    my ($col) = split("\n", $convertResult);
    $col =~ s/^\s+|\s+$//g;

    $resultsColRef->[$colIdx] = $col;

    $colIdx++;
}

print Dumper $resultsColRef;
