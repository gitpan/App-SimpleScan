use Test::More tests=>2;
use Test::Differences;

my $expected = <<EOS;
UNNAMED_TEST: tests=9, ok=8, failed=1, skipped=1, todo=2 (1 UNEXPECTEDLY SUCCEEDED)
EOS

my $got = `bin/simple_report <t/noplan.tap`;
eq_or_diff $got, $expected, "output as planned";

$expected = <<EOS;
UNNAMED_TEST: tests=9, ok=8, failed=1, skipped=1, todo=2 (1 UNEXPECTEDLY SUCCEEDED)
F 7 Deliberately broken test (asia) [http://asia.search.yahoo.com/search/news?p=bush&ei=UTF-8&fr=sfp&fl=0&x=wrt&debug=qa] [/fnord/ should match]
T 9 unexpected success (asia) [http://asia.search.yahoo.com/search/news?p=bush&ei=UTF-8&fr=sfp&fl=0&x=wrt&debug=qa] [/yahoo/ should match]
EOS

$got = `bin/simple_report -v <t/noplan.tap`;
eq_or_diff $got, $expected, "extended output as planned";

