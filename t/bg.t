use strict;
use warnings;
use utf8;
#use open qw( :encoding(UTF-8) :std );
use Test::More tests => 200;
use Encode qw( encode );
use Lingua::Stem::UniNE::BG qw( stem_bg );

my @singles = qw(
    да е не се и
    на си ще за ли
    в ти че от ми
    с го съм аз те
    но ме са тук а
    ако ви по той има
    му как ни я мен
    знам теб ги искам още
    тя до този сте тази
    нали или сме би един

    уникришан тридент такар изпатил шезван
    чунгу запаметим вран копнуол улфиулис
    леонтес брастиас пелиор уктър лотхаиан
    нентес карадос ватсал шетх шарат
    шантарам падней флой чантин боугх
    муек аvetorrents каледин рбдлг замков
    посвестим вартанич даронкин преснемем поразсъниш
    шматкат попловков жилфонд опаткат одрусай
    хандабар носков донцов бабк пораздърпам
    изпращял делаувер собтвеност уилингтон нмаерим
);

my @pairs = (
    [ това      => 'тов'      ], [ какво     => 'какв'     ],
    [ добре     => 'добр'     ], [ трябва    => 'трябв'    ],
    [ няма      => 'ням'      ], [ така      => 'так'      ],
    [ може      => 'мож'      ], [ много     => 'мног'     ],
    [ като      => 'кат'      ], [ беше      => 'беш'      ],
    [ нещо      => 'нещ'      ], [ само      => 'сам'      ],
    [ защо      => 'защ'      ], [ сега      => 'сег'      ],
    [ всичко    => 'всичк'    ], [ мога      => 'мог'      ],
    [ къде      => 'къд'      ], [ когато    => 'ког'      ],
    [ което     => 'коет'     ], [ всички    => 'всичк'    ],
    [ хайде     => 'хайд'     ], [ благодаря => 'благодар' ],
    [ просто    => 'прос'     ], [ нищо      => 'нищ'      ],
    [ малко     => 'малк'     ], [ толкова   => 'толков'   ],
    [ време     => 'врем'     ], [ моля      => 'мол'      ],
    [ вече      => 'веч'      ], [ мисля     => 'мисл'     ],
    [ защото    => 'защ'      ], [ който     => 'койт'     ],
    [ преди     => 'пред'     ], [ него      => 'нег'      ],
    [ наистина  => 'наистин'  ], [ става     => 'став'     ],
    [ една      => 'едн'      ], [ каза      => 'каз'      ],
    [ точно     => 'точн'     ], [ които     => 'коит'     ],
    [ повече    => 'повеч'    ], [ никога    => 'никог'    ],
    [ едно      => 'едн'      ], [ тогава    => 'тогав'    ],
    [ колко     => 'колк'     ], [ работа    => 'раб'      ],
    [ кажа      => 'каж'      ], [ бъде      => 'бъд'      ],
    [ години    => 'годин'    ], [ както     => 'какт'     ],

    [ недоразомение => 'недоразомени' ], [ банери        => 'баняр'        ],
    [ корато        => 'кор'          ], [ играине       => 'играин'       ],
    [ валентинио    => 'валентини'    ], [ кабаретен     => 'кабаретн'     ],
    [ свежарче      => 'свежарч'      ], [ заменки       => 'заменк'       ],
    [ кхао          => 'кха'          ], [ дъвчела       => 'дъвчел'       ],
    [ близкоия      => 'близк'        ], [ суипър        => 'суипр'        ],
    [ кинокритиците => 'кинокритик'   ], [ хуйни         => 'хуйн'         ],
    [ кинокритици   => 'кинокритик'   ], [ видеопиратите => 'видеопират'   ],
    [ кинопремиери  => 'кинопремияр'  ], [ облава        => 'облав'        ],
    [ кинешма       => 'кинешм'       ], [ доизплатят    => 'доизплат'     ],
    [ доскачахте    => 'доскачах'     ], [ доплувахте    => 'доплувах'     ],
    [ преснимани    => 'пресниман'    ], [ трейлърите    => 'трейлр'       ],
    [ бульба        => 'бульб'        ], [ витаминчета   => 'витаминч'     ],
    [ алешенка      => 'алешенк'      ], [ лизинка       => 'лизинк'       ],
    [ пашиното      => 'пашин'        ], [ умерли        => 'умерл'        ],
    [ макаровна     => 'макаровн'     ], [ венка         => 'венк'         ],
    [ охааа         => 'охаа'         ], [ митрофанова   => 'митрофанов'   ],
    [ трикотажния   => 'трикотажн'    ], [ перчеместият  => 'перчемест'    ],
    [ наближиха     => 'наближих'     ], [ миленка       => 'миленк'       ],
    [ набягахте     => 'набягах'      ], [ бортко        => 'бортк'        ],
    [ лаувери       => 'лаувяр'       ], [ мисионерство  => 'мисионерств'  ],
    [ никарауга     => 'никарауг'     ], [ дарителни     => 'дарителн'     ],
    [ взломове      => 'взлом'        ], [ скринове      => 'скрин'        ],
    [ притискало    => 'притискал'    ], [ споменчета    => 'споменч'      ],
    [ жилни         => 'жилн'         ], [ жилна         => 'жилн'         ],
);

#for my $word (@singles) {
for my $word (map { encode('UTF-8', $_) } @singles) {
    is stem_bg($word), $word, "$word stems to itself";
}

for my $pair (@pairs) {
    #my ($word, $stem) =  @$pair;
    my ($word, $stem) = map { encode('UTF-8', $_) } @$pair;
    is stem_bg($word), $stem, "$word stems to $stem";
}
