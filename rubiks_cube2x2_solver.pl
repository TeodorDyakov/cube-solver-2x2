
solved(
cube(C1,C1,C1,C1,C2,C2,C2,C2,C3,C3,C3,C3,C4,C4,C4,C4,C5,C5,C5,C5,C6,C6,C6,C6)).

layer_one_solved(
cube(C1,C2,C3,C4,C5,C6,C7,C7,C8,C8,C8,C8,C9,C10,C11,C11,C12,C13,C14,C14,C15,C16,C17,C17)).

solve([], Cube, Cube).
solve([NextRotation | Rotation], Cube, EndState) :- solve(Rotation, CurrentState, EndState),
rotateside(NextRotation, Cube, CurrentState).

%cube(y,y,y,y,r,r,b,b,w,w,w,w,o,o,g,g,b,b,o,o,g,g,r,r)
%cube(y,y,y,y,o,o,o,o,w,w,w,w,r,r,r,r,g,g,g,g,b,b,b,b)

?- solve(Solution,cube(y,y,y,y,r,r,b,b,w,w,w,w,o,o,g,g,b,b,o,o,g,g,r,r), C),
 layer_one_solved(C),
 write(Solution).

rotateside(up,
cube(C1, C2, C3, C4,  C5,  C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C3, C1, C4, C2, C21, C22, C7, C8, C9, C10, C11, C12, C17, C18, C15, C16,  C5,  C6, C19, C20, C13, C14, C23, C24)).

rotateside(up_prim,
cube(C1, C2, C3, C4,  C5,  C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C2, C4, C1, C3, C17, C18, C7, C8, C9, C10, C11, C12, C21, C22, C15, C16, C13, C14, C19, C20,  C5,  C6, C23, C24)).

rotateside(right,
cube(C1, C2, C3, C4, C5,  C6, C7, C8,  C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C6, C3, C8, C5, C10, C7, C12, C9, C15, C11, C13,  C4, C14,  C2, C16, C17, C18, C19, C20, C23, C21, C24, C22)).

rotateside(right_prim,
cube(C1,  C2, C3,  C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C15, C3, C13, C5, C2, C7, C4, C9,  C6, C11,  C8, C12, C14, C10, C16, C17, C18, C19, C20, C22, C24, C21, C23)).

rotateside(left,
cube(C1, C2, C3,   C4, C5, C6, C7, C8,  C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C2, C20, C18, C7, C5, C8, C6, C23, C21, C11, C12, C13, C14, C15, C16, C17,  C9, C19, C10,  C3, C22,  C4, C24)).

rotateside(left_prim,
cube(C1, C2,  C3,  C4, C5, C6, C7, C8,  C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24),
cube(C1, C2, C21, C23, C6, C8, C5, C7, C18, C20, C11, C12, C13, C14, C15, C16, C17,  C4, C19,  C3, C10, C22,  C9, C24)).



