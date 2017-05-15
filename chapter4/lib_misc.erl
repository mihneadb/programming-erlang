-module(lib_misc).
-export([
    for/3, qsort/1, pythag/1,
    perms/1, my_tuple_to_list/1,
    my_time_func/1, my_date_string/0
]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
    [ {A, B, C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(1, N),
        C <- lists:seq(1, N),
        A + B + C =< N,
        A * A + B * B =:= C * C
    ].

perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L -- [H])].

my_tuple_to_list({}) -> [];
my_tuple_to_list(T) -> [element(1, T) | my_tuple_to_list(erlang:delete_element(1, T))].

% Times F() in milliseconds.
my_time_func(F) ->
    S = erlang:monotonic_time(millisecond),
    F(),
    N = erlang:monotonic_time(millisecond),
    N - S.

my_date_string() ->
    {{Year, Month, Day}, {Hours, Minutes, Seconds}} = calendar:local_time(),
    io_lib:format("~w:~w:~w ~w.~w.~w", [Hours, Minutes, Seconds, Day, Month, Year]).
