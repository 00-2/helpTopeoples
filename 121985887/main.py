import unittest


class TestListMethods(unittest.TestCase):
    def test_append(self):
        tmpList = MyList()
        tmpList.append(10)
        tmpList.append(12)
        self.assertTrue(tmpList.size == 2 and (tmpList.pointer.data == 10) and (tmpList.pointer.next.data == 12))

    def test_remove_out_of_bounds(self):
        tmpList = MyList()
        tmpList.append(10)
        tmpList.append(12)
        # self.assertRaises(IndexError,tmpList.remove(2))

    def test_remove_last(self):
        tmpList = MyList()
        tmpList.append(10)
        tmpList.append(12)
        tmpList.remove(1)
        self.assertTrue(tmpList.pointer.data == 10 and tmpList.size == 1)

    def test_remove_middle(self):
        tmpList = MyList()
        tmpList.append(10)
        tmpList.append(11)
        tmpList.append(12)
        tmpList.remove(1)
        self.assertTrue(tmpList.pointer.data == 10 and tmpList.pointer.next.data == 12 and tmpList.size == 2)

    def test_remove_first(self):
        tmpList = MyList()
        tmpList.append(10)
        tmpList.append(12)
        tmpList.remove(0)
        self.assertTrue(tmpList.pointer.data == 12 and tmpList.size == 1)

    def test_insert_create_list(self):
        tmpList = MyList()
        tmpList.insert(10, 0)
        self.assertTrue(tmpList.pointer.data == 10 and tmpList.size == 1)

    def test_insert_first(self):
        tmpList = MyList()
        tmpList.append(12)
        tmpList.insert(10, 0)
        self.assertTrue(tmpList.pointer.data == 10 and tmpList.size == 2)

    def test_insert_mid(self):
        tmpList = MyList()
        tmpList.append(12)
        tmpList.append(10)
        tmpList.append(13)
        tmpList.insert(9, 1)
        self.assertTrue(tmpList.pointer.data == 12 and tmpList.pointer.next.data == 9 and tmpList.pointer.next.next.data == 10 and tmpList.size == 4)

    def test_get(self):
        tmpList = MyList()
        tmpList.append(12)
        tmpList.append(10)
        tmpList.append(13)
        self.assertTrue(tmpList.get(0) == 12 and tmpList.get(1)==10 and not tmpList.get(2)==2)

    def test_get_out_of_bounds(self):
        tmpList = MyList()
        tmpList.append(10)
        tmpList.append(12)
        #self.assertRaises(IndexError,tmpList.get(2))

    def test_deque_push(self):
        tmpDeque = Deque()
        tmpDeque.push(10)
        tmpDeque.push(12)
        self.assertTrue(tmpDeque.pointer.data==10 and tmpDeque.pointer.next.data == 12 and tmpDeque.size==2)
    def test_deque_pop(self):
        tmpDeque = Deque()
        tmpDeque.push(10)
        tmpDeque.push(12)
        tmpDeque.push(13)
        self.assertTrue(tmpDeque.pop()==10 and tmpDeque.pop()==12 and tmpDeque.size==1)

    def test_stack_push(self):
        tmpStack = Stack()
        tmpStack.push(10)
        tmpStack.push(12)
        self.assertTrue(tmpStack.pointer.data==10 and tmpStack.pointer.next.data == 12 and tmpStack.size==2)
    def test_stack_pop(self):
        tmpStack = Stack()
        tmpStack.push(10)
        tmpStack.push(12)
        tmpStack.push(13)
        self.assertTrue(tmpStack.pop()==13 and tmpStack.pop()==12 and tmpStack.size==1)


class Node:

    def __init__(self, data):
        self.data = data
        self.next = None  # ссылка, которая в конструкторе коробки всегда пустая


class MyList:
    def __init__(self):
        self.pointer = None
        self.size = 0

    def append(self, new_data):
        new_element = Node(new_data)
        self.size = self.size + 1
        if self.pointer is None:
            self.pointer = new_element
            return
        end = self.pointer
        while end.next:
            end = end.next
        end.next = new_element

    def remove(self, position):
        if position > self.size - 1:
            raise IndexError
        if position == 0:
            self.size = self.size - 1
            if self.size == 0:
                self.pointer = None
            else:
                self.pointer = self.pointer.next
        else:
            end = self.pointer
            while position > 0:
                last = end
                end = end.next
                position = position - 1
            last.next = end.next
            self.size = self.size - 1

    def insert(self, new_data, position):
        if position == 0:
            if self.size == 0:
                self.pointer = Node(new_data)
                self.size=self.size+1
            else:
                new_element = Node(new_data)
                tmpPointer = self.pointer
                self.pointer = new_element
                new_element.next=tmpPointer
                self.size=self.size+1
        else:
            new_element = Node(new_data)
            end = self.pointer
            while position > 0:
                last = end
                end = end.next
                position = position - 1
            last.next = new_element
            new_element.next = end
            self.size = self.size + 1

    def get(self, position):
        if position > self.size - 1:
            raise IndexError
        end = self.pointer
        while position > 0:
            last = end
            end = end.next
            position = position - 1
        return end.data

class Deque:
    def __init__(self):
        self.pointer = None
        self.size = 0
    def pop(self):
        tmp = self.pointer.data
        self.pointer = self.pointer.next
        self.size=self.size-1
        return tmp
    def push(self,new_data):
        if self.pointer is None:
            self.pointer = Node(new_data)
            self.size=self.size+1
            return
        tmp=self.pointer
        while tmp.next:
            tmp = tmp.next
        tmp.next = Node(new_data)
        self.size = self.size + 1

class Stack:
    def __init__(self):
        self.pointer = None
        self.size = 0
    def pop(self):
        end=self.pointer
        while end.next:
            last = end
            end = end.next
        last.next = None
        self.size = self.size-1
        return end.data
    def push(self,new_data):
        new_element = Node(new_data)
        self.size = self.size + 1
        if self.pointer is None:
            self.pointer = new_element
            return
        end = self.pointer
        while end.next:
            end = end.next
        end.next = new_element

if __name__ == "__main__":
    unittest.main()
