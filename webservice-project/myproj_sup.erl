-module({{projectid}}_sup).

%%% This supervisor will execute {{projectid}}:start_link/0.

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    Children = [
		?CHILD({{projectid}}_cowboy, worker) 
		],
    {ok, { {one_for_one, 5, 10}, Children} }.
