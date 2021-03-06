use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More tests => 68;
use Lingua::Stem::UniNE::CS qw( stem );

is stem('zvířatech'), 'zvíř',    'remove case: -atech';
is stem('zvířatům'),  'zvíř',    'remove case: -atům';
is stem('dítětem'),   'dít',     'remove case: -tem from -ětem';
is stem('kterými'),   'kter',    'remove case: -ými';
is stem('rukama'),    'ruk',     'remove case: -ama';
is stem('ženami'),    'žen',     'remove case: -ami';
is stem('zvířata'),   'zvíř',    'remove case: -ata';
is stem('zvířaty'),   'zvíř',    'remove case: -aty';
is stem('pánové'),    'pán',     'remove case: -ové';
is stem('tátovi'),    'tát',     'remove case: -ovi';
is stem('novinách'),  'novin',   'remove case: -ách';
is stem('kterých'),   'kter',    'remove case: -ých';
is stem('chcete'),    'chk',     'remove case: -te from -ete';
is stem('deseti'),    'des',     'remove case: -ti from -eti';
is stem('řekněte'),   'řekn',    'remove case: -te from -ěte';
is stem('paměti'),    'pam',     'remove case: -ti from -ěti';
is stem('systému'),   'syst',    'remove case: -mu from -ému';
is stem('režimu'),    'reh',     'remove case: -mu from -imu';
is stem('letech'),    'let',     'remove case: -ch from -ech';
is stem('jejich'),    'jej',     'remove case: -ch from -ich';
is stem('dalších'),   'dalš',    'remove case: -ch from -ích';
is stem('mřížemi'),   'mříh',    'remove case: -mi from -emi';
is stem('zbraněmi'),  'zbran',   'remove case: -mi from -ěmi';
is stem('ostatními'), 'ostatn',  'remove case: -mi from -ími';
is stem('jiného'),    'jin',     'remove case: -ho from -ého';
note 'no test for: ',            'remove case: -ho from -iho';
is stem('jejího'),    'jej',     'remove case: -ho from -ího';
is stem('dělat'),     'děl',     'remove case: -at';
is stem('velmi'),     'vel',     'remove case: -mi';
is stem('pokus'),     'pok',     'remove case: -us';
is stem('letos'),     'let',     'remove case: -os';
is stem('tebou'),     'teb',     'remove case: -ou';
is stem('nemám'),     'nem',     'remove case: -ám';
is stem('rodičům'),   'rodič',   'remove case: -ům';
is stem('někým'),     'něk',     'remove case: -ým';
is stem('přines'),    'při',     'remove case: -es';
is stem('problém'),   'prob',    'remove case: -ém';
is stem('prosím'),    'pro',     'remove case: -ím';
is stem('během'),     'běh',     'remove case: -m from -em';
is stem('byla'),      'byl',     'remove case: -a';
is stem('možná'),     'možn',    'remove case: -á';
is stem('které'),     'kter',    'remove case: -é';
is stem('jako'),      'jak',     'remove case: -o';
is stem('jsou'),      'jso',     'remove case: -u';
is stem('domů'),      'dom',     'remove case: -ů';
is stem('tady'),      'tad',     'remove case: -y';
is stem('dobrý'),     'dobr',    'remove case: -ý';
is stem('jsme'),      'jsm',     'remove case: palatalize -e';
is stem('vážně'),     'vážn',    'remove case: palatalize -ě';
is stem('jestli'),    'jestl',   'remove case: palatalize -i';
is stem('není'),      'nen',     'remove case: palatalize -í';
is stem('pracovat'),  'prac',    'remove possessives: -ov';
is stem('králův'),    'král',    'remove possessives: -ův';
is stem('většina'),   'větš',    'remove possessives: -n from -in';
is stem('přečtěte'),  'přeck',   'palatalize: replace -čtě with -ck';
is stem('přečti'),    'přeck',   'palatalize: replace -čti with -ck';
is stem('američtí'),  'americk', 'palatalize: replace -čtí with -ck';
is stem('ještě'),     'jesk',    'palatalize: replace -ště with -sk';
is stem('letišti'),   'letisk',  'palatalize: replace -šti with -sk';
is stem('příští'),    'přísk',   'palatalize: replace -ští with -sk';
is stem('chce'),      'chk',     'palatalize: replace -ce with -k';
is stem('chci'),      'chk',     'palatalize: replace -ci with -k';
is stem('otče'),      'otk',     'palatalize: replace -če with -k';
is stem('sráči'),     'srák',    'palatalize: replace -či with -k';
is stem('peníze'),    'peníh',   'palatalize: replace -ze with -h';
is stem('mezi'),      'meh',     'palatalize: replace -zi with -h';
is stem('takže'),     'takh',    'palatalize: replace -že with -h';
is stem('muži'),      'muh',     'palatalize: replace -ži with -h';
is stem('jste'),      'jst',     'palatalize: remove last character';
