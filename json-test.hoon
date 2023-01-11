|%                             ::https://developers.urbit.org/reference  Produce a core, [battery payload]
                               ::this file at https://developers.urbit.org/guides/additional/json-guide
+$  user
  $:  username=@t
      name=[first=@t mid=@t last=@t]
      joined=@da
      email=@t
  ==
++  to-js                    ::Produce a normal arm.  p is the arm name, and q is any Hoon expression.  ++  p=term  q=hoon
  |=  usr=user               ::Produce a gate (a one-armed core with a sample).
  |^  ^-  json
  %-  pairs:enjs:format                    :: Call a gate (function).    https://developers.urbit.org/reference/hoon/zuse/2d_1-5#pairsenjsformat
  :~                               ::  Construct a null-terminated list
    ['username' s+username.usr]
    ['name' name]
    ['joined' (sect:enjs:format joined.usr)]
    ['email' s+email.usr]
  ==
  ++  name
    :-  %a                                :: :- construct 2 cell tuple
    :~                                    ::  Construct a null-terminated list
      [%s first.name.usr]
      [%s mid.name.usr]
      [%s last.name.usr]
    ==                                    :: end of :~
  --                                      :: end of core
++  from-js
  =,  dejs:format
  ^-  $-(json user)
  %-  ot
  :~
    [%username so]
    [%name (at ~[so so so])]
    [%joined du]
    [%email so]
  ==
--
