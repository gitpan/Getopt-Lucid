use 5.006;
use strict;
use warnings;
package Getopt::Lucid::Exception;
# ABSTRACT: Exception classes for Getopt::Lucid
our $VERSION = '1.00'; # VERSION

use Exception::Class 1.23 (
    "Getopt::Lucid::Exception" => {
        description => "Unidentified exception",
    },

    "Getopt::Lucid::Exception::Spec" => {
        description => "Invalid specification",
        alias => "throw_spec"
    },

    "Getopt::Lucid::Exception::ARGV" => {
        description => "Invalid argument on command line",
        alias => "throw_argv"
    },

    "Getopt::Lucid::Exception::Usage" => {
        description => "Invalid usage",
        alias => "throw_usage"
    },

);

sub import {
    my $caller = caller(0);
    {
        no strict 'refs';
        *{$caller."::$_"} = *{__PACKAGE__."::$_"}
            for qw( throw_spec throw_argv throw_usage);
    }
}

1;


__END__
=pod

=head1 NAME

Getopt::Lucid::Exception - Exception classes for Getopt::Lucid

=head1 VERSION

version 1.00

=head1 AUTHOR

David Golden <dagolden@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by David Golden.

This is free software, licensed under:

  The Apache License, Version 2.0, January 2004

=cut

