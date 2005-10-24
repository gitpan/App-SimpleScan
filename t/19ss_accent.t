use Test::More tests=>1;
use Test::Differences;
@output = `echo "http://fake.video.fr/q=clips+pour+madonna /Recherche de vidéos <b>pour/ Y French video matches"| perl -Iblib/lib bin/simple_scan -gen`;
@expected = (map {"$_\n"} (split /\n/,<<EOS));
use Test::More tests=>2;
use Test::WWW::Simple;
use strict;

my \@accents;
\@accents = (mech->get("http://fake.video.fr/q=clips+pour+madonna")) =~ /Recherche de vid(.)os <b>pour/
page_like "http://fake.video.fr/q=clips+pour+madonna",
          qr/Recherche de vid(.)os <b>pour/,
          "French video matches [http://fake.video.fr/q=clips+pour+madonna] [/Recherche de vid(.)os <b>pour/ should match]";
is \$accent[0], chr(233), "Accent char 0 as expected";
EOS
push @expected,"\n";
eq_or_diff [@output], [@expected], "got expected output";
