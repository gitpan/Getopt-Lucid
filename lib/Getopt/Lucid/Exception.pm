use 5.006;
use strict;
use warnings;
package Getopt::Lucid::Exception;
# ABSTRACT: Exception classes for Getopt::Lucid
our $VERSION = '1.03'; # VERSION

use Exporter;
our @ISA = qw/Exporter Exception::Class::Base/;
our @EXPORT = qw( throw_spec throw_argv throw_usage);

use Exception::Class 1.23 (
    "Getopt::Lucid::Exception" => {
        description => "Unidentified exception",
    },

    "Getopt::Lucid::Exception::Spec" => {
        description => "Invalid specification",
    },

    "Getopt::Lucid::Exception::ARGV" => {
        description => "Invalid argument on command line",
    },

    "Getopt::Lucid::Exception::Usage" => {
        description => "Invalid usage",
    },

);

sub throw_spec {
    Getopt::Lucid::Exception::Spec->throw("$_[0]\n");
}

sub throw_argv {
    Getopt::Lucid::Exception::ARGV->throw("$_[0]\n");
}

sub throw_usage {
    Getopt::Lucid::Exception::Usage->throw("$_[0]\n");
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Getopt::Lucid::Exception - Exception classes for Getopt::Lucid

=head1 VERSION

version 1.03

=for Pod::Coverage description
throw_argv
throw_spec
throw_usage

=head1 AUTHOR

David Golden <dagolden@cpan.org>

=head1 CONTRIBUTOR

Robert Bohne <rbo@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2013 by David Golden.

This is free software, licensed under:

  The Apache License, Version 2.0, January 2004

=cut
