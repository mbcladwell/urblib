|%
+$  user
  $:  username=@t
      name=[first=@t mid=@t last=@t]
      joined=@da
      email=@t
  ==
++  to-js
  |=  usr=user
  |^  ^-  json
  %-  pairs:enjs:format
  :~
    ['username' s+username.usr]
    ['name' name]
    ['joined' (sect:enjs:format joined.usr)]
    ['email' s+email.usr]
  ==
  ++  name
    :-  %a
    :~
      [%s first.name.usr]
      [%s mid.name.usr]
      [%s last.name.usr]
    ==
  --
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
