-module(manius_count).
-export([wc_file/1]).

wc_file(FilePath) ->
  {ok, FileHandler} = file:open(FilePath, [read]),
  count_items(FileHandler).

count_items(FileHandler) ->
  count_items(FileHandler, {0, 0}).

count_items(FileHandler, {Lines, Chars}) ->
  case file:read(FileHandler, 1) of
    eof -> {Lines, Chars};
    {ok, Data} ->
      case Data of
        "\n" -> count_items(FileHandler, {Lines + 1, Chars + 1});
        _ -> count_items(FileHandler, {Lines, Chars + 1})
      end
  end.
