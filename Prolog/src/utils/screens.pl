:- module(utils_screens, [promptChoice/2, waitInput/0, waitInput/1, cls/0]).
:- encoding(utf8).

searchDict(Dict, Key, Result):-
    string_length(Key, L), L =:= 1,
    sub_atom(Key, 0, 1, _, C1), string_lower(C1, R1), atom_string(K,R1),
    Result=Dict.get(K).

promptChoice(Options, Value) :- read_line_to_string(user_input, S),
                                searchDict(Options, S, Value),!;
                                write_ln('Invalid option! Try again.'),
                                promptChoice(Options,Value).

waitInput:- waitInput('').

waitInput(S):-
    write_ln(S),
    write_ln('Press any key to continue.'),
    get_single_char(_),nl.

cls:- current_prolog_flag(unix,_), tty_clear;true.
