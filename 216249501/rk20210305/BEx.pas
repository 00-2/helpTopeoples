program Hello;

/*
const MAXSIZE = 50;
type Stack = record  { стек рассчитан на 50 символов }
      tags: array[1..MAXSIZE] of char;
      size: integer; { число элементов }
     end;

procedure Push( var S: Stack; x: char);
begin
  if S.size = MAXSIZE then Exit;  // выход, если произошло переполнение стека
  S.size := S.size + 1;
  S.tags[S.size] := x; // добавляем элемент
end;

function Pop ( var S:Stack ): char;
begin
  if S.size = 0 then begin
    Pop:= char(255); // 255 - пустой символ, ошибка - стек пуст
    Exit;
  end;
  Pop:= S.tags[S.size];
  S.size := S.size - 1;
end;

function isEmptyStack ( S: Stack ): Boolean;
begin
  isEmptyStack := (S.size = 0);
end;

var
    S: Stack;
begin
   Push(S,'a');
   Push(S,'B');
   Push(S,'B');
   write(Pop(S));
   write(Pop(S));
   write(Pop(S));

end.
*/

program Hello;

const MAXSIZE = 50;

type Queue = record
       data: array[1..MAXSIZE] of char;
       head, tail: integer;
     end;


procedure Push( var Q: Queue; x: char);
begin
  Q.tail := Q.tail + 1;
  Q.data[Q.tail] := x;
end;

function Pop ( var Q: Queue ): char;
begin
  Q.head := Q.head + 1;
  Pop := Q.data[Q.head];
end;

var
    Q: Queue;
    i:integer;
begin
   
   Push(Q,'a');
   Push(Q,'B');
   Push(Q,'C');
   write(Pop(Q));
   write(Pop(Q));
   write(Pop(Q));
    writeln;
end.
     
     
