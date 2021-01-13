f = open("in.txt")
out = open("out.txt","w")
for string in f: 
  string = " " +string + " "
  for index, char in enumerate(string):
      if char in {'+', '-', '*', '/'}:
          operation_index = index
          operation = char
          break
      else:
        operation_index=-1
  if not (operation_index == -1):
    for index in range(operation_index - 1, -1, -1):
      if not string[index].isdigit() and string[index] != '.':
        left_part = string[index + 1:operation_index]
        break
 
    for index in range(operation_index + 1, len(string)):
      if not string[index].isdigit() and string[index] != '.':
        right_part = string[operation_index + 1:index]
        break
    left_part = int(left_part)
    right_part = int(right_part)
    if operation == "+":
      n = left_part+right_part
    elif operation == "-":
      n = left_part-right_part
    elif operation == "*":
      n = left_part*right_part
    elif operation == "/":
      n = int(left_part/right_part)

  else:
    n=1
  string = string.replace("\n","")
  string = string.rstrip()
  string = string.lstrip()
  for i in range(n):
    out.write(string+"\n")
    print(string)
out.close()
f.close()
