-module(lib_misc).
-export([sqrt/1]).

sqrt(N) when N < 0 -> error({squareRootNegativeArgument, N});
sqrt(N) -> math:sqrt(N).

