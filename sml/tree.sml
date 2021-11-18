(*
10
| \
5  15
|\  | \
2 6 16 20

5
|\
2 10
  /\
 6  15
    | \
    16 20

Node(Node(Null, 2, Null), 5, Node( Node(Null, 6, Null), 10, Node(Node(Null, 16, Null), 15, Node(Null, 20, Null))))


Node(
  Node(Empty, 2, Empty),
  5,
  Node(
    Node(Empty, 6, Empty),
    10,
    Node(
      Node(Empty, 16, Empty),
      15,
      Node(Empty, 20, Empty),
    ),
  )
)


Node(
  Node(
    Node(Empty,2,Empty),
    5,
    Node(Empty,6,Empty)
  ),
  10,
  Node(
    Node(Empty,16,Empty),
    15,
    Node(Empty,20,Empty)
  )
)
*)
datatype 'a Tree = Empty
                 | Node of 'a Tree * 'a * 'a Tree

(*
  treemap :: ('a -> 'b) -> 'a Tree -> 'b Tree
*)
fun treemap f Empty = Empty
  | treemap f (Node (l, x, r)) = Node (treemap f l, f x, treemap f r)
(*
λ> treemap (fn x => x+1) (Node (Empty, 3, Empty));
val it = Node (Empty,4,Empty) : int Tree
*)

(*
  inorder :: 'a Tree -> 'a list
*)
fun preorder Empty = []
  | preorder (Node (l, x, r)) = [x] @ (preorder l) @ (preorder r)
(*
λ> preorder(Node (Empty, 3, Empty))
val it = [3] : int list

λ> preorder (Node( Node( Node(Empty,2,Empty), 5, Node(Empty,6,Empty)), 10, Node( Node(Empty,16,Empty), 15, Node(Empty,20,Empty))))
= ;
val it = [10,5,2,6,15,16,20] : int list
*)

fun postorder Empty = []
  | postorder (Node (l, x, r)) = (postorder l) @ (postorder r) @ [x]
(*
λ> postorder (Node( Node( Node(Empty,2,Empty), 5, Node(Empty,6,Empty)), 10, Node( Node(Empty,16,Empty), 15, Node(Empty,20,Empty))));
val it = [2,6,5,16,20,15,10] : int list
*)

fun inorder Empty = []
  | inorder (Node (l, x, r)) = (inorder l) @ [x] @ (inorder r)
(*
λ> inorder (Node( Node( Node(Empty,2,Empty), 5, Node(Empty,6,Empty)), 10, Node( Node(Empty,16,Empty), 15, Node(Empty,20,Empty))));
val it = [2,5,6,10,16,15,20] : int list
*)

(*
  rotClock :: 'a tree -> 'a tree
*)
fun rotClock Empty = Empty
fun rotClock (Node(Empty, x, r)) = Node(Empty, x, r)
fun rotClock (Node(Node(ll, lx, lr), x, r)) = Node(ll, lx, Node(lr, x, r))
