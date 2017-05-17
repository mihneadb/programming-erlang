-module(lib_misc).
-export([count_characters/1, map_search_pred/2, is_value_even/2]).

count_characters(Str) -> count_characters(Str, #{}).

count_characters([], Acc) -> Acc;
count_characters([H|T], Acc) -> count_characters(T, maps:put(H, maps:get(H, Acc, 1), Acc)).

map_search_pred(Map, Pred) -> hd(lists:filter(fun({Key, Value}) -> Pred(Key, Value) end, maps:to_list(Map))).

is_value_even(_, Value) -> Value rem 2 =:= 0.

% 47> lib_misc:map_search_pred(#{a=>1, b=>2, c=>3, d=>4}, fun(_, X) -> X rem 2 =:= 0 end).
% {b,2}
% 48> lib_misc:map_search_pred(#{a=>1, b=>2, c=>3, d=>4}, fun lib_misc:is_value_even/2).
% {b,2}
