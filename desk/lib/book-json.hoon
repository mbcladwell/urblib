|%                             ::https://developers.urbit.org/reference  Produce a core, [battery payload];
                               ::this file at https://developers.urbit.org/guides/additional/json-guide
+$  book
  $:  title=@t
      author=[first=@t mid=@t last=@t]
      id=@u
      genre=@t      
  ==
++  to-js                    ::Produce a normal arm.  p is the arm name, and q is any Hoon expression.  ++  p=term  q=hoon
  |=  bk=book               ::Produce a gate (a one-armed core with a sample).
  |^  ^-  json
  %-  pairs:enjs:format                    :: Call a gate (function).    https://developers.urbit.org/reference/hoon/zuse/2d_1-5#pairsenjsformat
  :~                               ::  Construct a null-terminated list
    ['title' s+title.bk]
    ['author' author]
    ['id' (numb:enjs:format id.bk)]
    ['genre' s+genre.bk]
  ==
  ++  author
    :-  %a                               :: :- construct 2 cell tuple
    :~                                    ::  Construct a null-terminated list
      [%s first.author.bk]               :: %s is json type string
      [%s mid.author.bk]
      [%s last.author.bk]
    ==                                   :: end of :~
  --                                     :: end of core


++  from-js
  =,  dejs:format                        ::expose namespace
  ^-  $-(json book)                      :: convert json to book;
  %-  ot                                 ::call a gate (function)
  :~                                     ::Typecast by explicit type label.
    [%title so]                       ::The +so functions just decode $json strings to cords.
    [%author (at ~[so so so])]        ::+at function converts a $json array to a tuple, decoding each element with the respective function given in its argument list
    [%id ni]
    [%genre so]
  ==
 --
