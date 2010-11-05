
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Clear, readable syntax for command line processing',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>',
  'BUILD_REQUIRES' => {
    'Data::Dumper' => '0',
    'Exception::Class::TryCatch' => '1.10',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::More' => '0.62'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Getopt-Lucid',
  'EXE_FILES' => [],
  'LICENSE' => 'apache',
  'NAME' => 'Getopt::Lucid',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Exception::Class' => '1.23',
    'Exporter' => '0',
    'Storable' => '2.16',
    'vars' => '0'
  },
  'VERSION' => '0.19',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



