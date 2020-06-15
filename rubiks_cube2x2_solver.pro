%the cube is represented as a fact with 24 arguments,
%where each argument represents the color of the sticker at that position.
%The Positions are according to cube_diagram.png

sune_or_up(up).
sune_or_up(sune).

not_sune(up).
not_sune(right).
not_sune(front).
not_sune(up_prim).
not_sune(front_prim).
not_sune(right_prim).


solved(
cube(C1,C1,C1,C1,C2,C2,C2,C2,C3,C3,C3,C3,C4,C4,C4,C4,C5,C5,C5,C5,C6,C6,C6,C6)).

layer_one_solved(
cube(C1,C2,C3,C4,C5,C6,C7,C7,C8,C8,C8,C8,C9,C10,C11,C11,C12,C13,C14,C14,C15,C16,C17,C17)).

top_oriented(
cube(C1,C1,C1,C1,C2,C3,C4,C4,C5,C5,C5,C5,C7,C8,C9,C9,C10,C11,C12,C12,C13,C14,C15,C15)).

%recursive predicate which finds the moves from scrambled cube to solved layer one.
solve_layer_one([], Cube, Cube).
solve_layer_one([NextRotation | Rotation], Cube, EndState) :- solve_layer_one(Rotation, CurrentState, EndState),
rotateside(NextRotation, Cube, CurrentState), not_sune(NextRotation).


%recursive predicate which finds the moves from cube with one layer solved to cube with top oriented.
orient_top([], Cube, Cube).
orient_top([NextRotation | Rotation], Cube, EndState) :- orient_top(Rotation, CurrentState, EndState),
rotateside(NextRotation, Cube, CurrentState), sune_or_up(NextRotation).

?-
%G_scramble := cube(y,y,y,y,r,r,b,b,w,w,w,w,o,o,g,g,b,b,o,o,g,g,r,r).
%G_scramble := cube(y,y,y,y,o,o,o,o,w,w,w,w,r,r,r,r,g,g,g,g,b,b,b,b).
G_scramble := cube(b,y,g,o,r,b,o,o,w,y,o,r,r,w,w,b,r,y,w,g,y,b,g,g).
%G_scramble := cube(b,y,g,w,w,b,r,b,y,y,g,b,o,r,w,o,y,r,w,g,o,g,o,r).
%G_scramble := cube(o,g,y,r,b,y,b,b,w,w,w,w,r,y,g,g,g,o,o,o,b,y,r,r).

%?-
%top_oriented(cube(y,o,r,g,y,o,r,r,w,w,w,w,y,b,o,o,r,g,b,b,y,b,g,g)).
?-
 	solve_layer_one(Solution,G_scramble, C),
 	layer_one_solved(C),
 	write(Solution),
 	orient_top(Solution2, C, X),
 	top_oriented(X),
 	write(Solution2).


%permutation of cube after rotating up side clockwise
rotateside(up,
cube(C1, C2, C3, C4,  C5,  C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C3, C1, C4, C2, C21, C22, C7, C8, C9, C10, C11, C12, C17, C18, C15, C16,  C5,  C6, C19, C20, C13, C14, C23, C24)).

%permutation of cube after rotating up side anti-clockwise
rotateside(up_prim,
cube(C1, C2, C3, C4,  C5,  C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C2, C4, C1, C3, C17, C18, C7, C8, C9, C10, C11, C12, C21, C22, C15, C16, C13, C14, C19, C20,  C5,  C6, C23, C24)).

%permutation of cube after rotating right side clockwise
rotateside(right,
cube(C1, C2, C3, C4, C5,  C6, C7, C8,  C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C6, C3, C8, C5, C10, C7, C12, C9, C15, C11, C13,  C4, C14,  C2, C16, C17, C18, C19, C20, C23, C21, C24, C22)).

%permutation of cube after rotating right side anti-clockwise
rotateside(right_prim,
cube(C1,  C2, C3,  C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C15, C3, C13, C5, C2, C7, C4, C9,  C6, C11,  C8, C12, C14, C10, C16, C17, C18, C19, C20, C22, C24, C21, C23)).

%permutation of cube after rotating front side clockwise
rotateside(front,
cube(C1, C2, C3,   C4, C5, C6, C7, C8,  C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C2, C20, C18, C7, C5, C8, C6, C23, C21, C11, C12, C13, C14, C15, C16, C17,  C9, C19, C10,  C3, C22,  C4, C24)).

%permutation of cube after rotating front side anti-clockwise
rotateside(front_prim,
cube(C1, C2,  C3,  C4, C5, C6, C7, C8,  C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C2, C21, C23, C6, C8, C5, C7, C18, C20, C11, C12, C13, C14, C15, C16, C17,  C4, C19,  C3, C10, C22,  C9, C24)).


rotateside('sune',
cube(C1 , C2,   C3,  C4, C5,  C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C6 , C3,  C22, C14, C2, C17, C7, C8, C9, C10, C11, C12,  C5, C21, C15, C16,  C4, C13, C19, C20,  C1, C18, C23, C24)).
