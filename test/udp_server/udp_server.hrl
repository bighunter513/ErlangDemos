

%% @type udp_server_option() =
%%  {option(), port(), max_restarts(), time(), shutdown(),
%%   recv_length(), recv_timeout()}.
%%  A data structure holding the options.
%% @type option()       = [term()].
%% @type port()         = integer().
%% @type max_restarts() = integer().
%% @type time()         = integer().
%% @type shutdown()     = integer().
%% @type recv_length()  = integer().
%% @type recv_timeout() = integer() | infinity.

-define(PORT, 4000).

-record(udp_server_option, {
  option = [binary],
  port = ?PORT,
  max_restarts = 3,
  time = 60,
  shutdown = 2000,
  recv_length = 0,
  recv_timeout = infinity
}).
 










