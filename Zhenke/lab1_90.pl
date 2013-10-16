p([],[]).
p(L,[H|S]):- append(V,[H|U],L),
                  append(V,U,W),
                  p(W,S).
