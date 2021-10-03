:- module(screens_main, [screen/1]).
:- encoding(utf8).

:- use_module("./src/utils/screens.pl").
:- use_module("./src/screens/books.pl", []).

screen('start'):-
    utils_screens:cls,
    writeln('\n=-=-=-=-=-=-=-=-=-=\nMy Reading Journal\n=-=-=-=-=-=-=-=-=-=\n\n\c
        1) Add books\n\c
        2) Edit books\n\c
        3) List books\n\c
        4) Delete books\n\c
        5) See book suggestion\n\c
        6) Edit reading goal\n\n\c
        7) Exit\n\n\n\c
        Your choice:\n'),
    NextScreens = _{
        '1':'add_book',
        '2':'edit_book',
        '3':'list_books',
        '4':'delete_books',
        '5':'book_suggestion',
        '6':'edit_goal',
        '7':'exit'
    },
    promptChoice(NextScreens, Next),
    (
        screen(Next);
        screens_books:screen(Next)
    ),
    screen('start').

screen('exit'):-
    cls,
    writeln('\n=-=-=-=-=-=-=-=-=-=\nAté logo!\n=-=-=-=-=-=-=-=-=-=\n'),
    halt.
