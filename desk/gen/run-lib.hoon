/+  book-json
/+  lull

|=  n=@t
|-
~&  n
?:  =(n 1)
  1
%+  mul
n
%=  $
  n  (dec n)
==

=a (to-js:book-json ['BookTitle' ['John' 'William' 'Smith'] 1 'fiction']) 

~a


:: =bjs -build-file %/lib/book-json/hoon
:: (book:book-json:bjs ['BookTitle' ['John' 'William' 'Smith'] 1 'fiction'] b)

:: =rl -build-file %/lib/run-lib/hoon
