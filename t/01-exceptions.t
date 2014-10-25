#!/usr/bin/perl
use strict;
use warnings;
use blib;  

# Getopt::Lucid::Exception  

#--------------------------------------------------------------------------#
# Test cases
#--------------------------------------------------------------------------#

my (@exceptions, @throw_aliases);

BEGIN {
    @exceptions = qw(
        Getopt::Lucid::Exception
        Getopt::Lucid::Exception::Spec
        Getopt::Lucid::Exception::ARGV
    );
    @throw_aliases = qw(
        throw_spec
        throw_argv
    );
}

#--------------------------------------------------------------------------#
# Test script
#--------------------------------------------------------------------------#

use Test::More tests => 2 + @exceptions;
use Test::Exception;

# Work around win32 console buffering that can show diags out of order
Test::More->builder->failure_output(*STDOUT) if $ENV{HARNESS_VERBOSE};

use Getopt::Lucid::Exception;
use Getopt::Lucid ':all';

throws_ok { $_->throw } $_, "throwing $_" for @exceptions;
can_ok( "Getopt::Lucid$_", @throw_aliases ) for ( "::Exception", "" );


