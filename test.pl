use strict;
use Cwd;
use TAP::Harness;
my $cwd = getcwd();
my %args = (lib => ["$cwd/lib", @INC]);
chdir 't' or die "Could not chdir to t";
opendir(DIR, '.') or die "Unable to open directory";
my @files = grep /\.t$/, readdir DIR;
my $harness = new TAP::Harness(\%args);
$harness->runtests(@files);