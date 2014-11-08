use strict;
use warnings;
use utf8;
use Test::More;

use Acme::EnclosedChar qw/
    enclose
    enclose_katakana
    enclose_week_ja
    enclose_kansuji
/;

is enclose(), '';
is enclose(undef), '';

is enclose('0'), '⓪';
is enclose('1'), '①';
is enclose('012345'), '⓪①②③④⑤';
is enclose('0!12!34!5!'), '⓪!⑫!㉞!⑤!';
is enclose('Perl'), 'Ⓟⓔⓡⓛ';
is enclose('Rubyは1993/2/24生まれ'), 'Ⓡⓤⓑⓨは①⑨⑨③/②/㉔生まれ';

is enclose_katakana('アロハ'), '㋐㋺㋩';

is enclose_week_ja('月曜から金曜まで'), '㊊曜から㊎曜まで';

is enclose_kansuji('加藤一二三'), '加藤㊀㊁㊂';


done_testing;
