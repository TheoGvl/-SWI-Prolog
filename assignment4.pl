:- module(assignment4, [add/3, even/1, max/3, 
    factorial/2, palindrome/1, sum_list/2, 
    list_length/2, last_element/2, count_occurrences/3, member_of/2]).

% add/3: Προσθέτει δύο αριθμούς
add(X, Y, Z) :- Z is X + Y.

% even/1: Ελέγχει αν ένας αριθμός είναι άρτιος
even(X) :- 0 is X mod 2.

% max/3: Επιστρέφει τον μέγιστο από δύο αριθμούς
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y > X.

% factorial/2: Υπολογίζει το παραγοντικό ενός αριθμού
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% palindrome/1: Ελέγχει αν μια λίστα είναι παλίνδρομη
palindrome(L) :- reverse(L, L).

% sum_list/2: Υπολογίζει το άθροισμα των στοιχείων μιας λίστας
sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, S),
    Sum is H + S.

% list_length/2: Υπολογίζει το μήκος μιας λίστας
list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

% last_element/2: Επιστρέφει το τελευταίο στοιχείο μιας λίστας
last_element([X], X).
last_element([_|T], X) :-
    last_element(T, X).

% member_of/2: Ελέγχει αν ένα στοιχείο ανήκει σε μια λίστα
member_of(X, [X|_]).
member_of(X, [_|T]) :-
    member_of(X, T).

% count_occurrences/3: Μετράει τις εμφανίσεις ενός στοιχείου σε μια λίστα
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :-
    count_occurrences(X, T, N1),
    N is N1 + 1.
count_occurrences(X, [Y|T], N) :-
    X \= Y,
    count_occurrences(X, T, N).
