-module(manius_count_test).
-compile(export_all).

% Include etest's assertion macros.
-include_lib("etest/include/etest.hrl").

fixture_path(FileName) ->
  case file:get_cwd() of
    {ok, CurrentPath} -> CurrentPath ++ "/test/fixtures/" ++ FileName
  end.

test_counting_file_lines() ->
  ?assert_equal({2, 13}, manius_count:wc_file(fixture_path("sample.txt"))).

