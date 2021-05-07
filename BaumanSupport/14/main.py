class Node:
    def __init__(self,name):
        self.name = name
class Edge:
    def __init__(self, src, dest):
        self.src = src
        self.dest = dest
    def __str__(self):
        return f'{self.src.name}->{self.dest.name}'
class Digraph(object):
    def __init__(self):
        self.edges = {}
    def addNode(self,node):
        if node in self.edges:
            raise ValueError('Duplicate node')
        else:
            self.edges[node]=[]
    def addEdge(self,edge):
        src = edge.src
        dest = edge.dest
        if not (src in self.edges and dest in self.edges):
            raise ValueError('Node not in graph')
        self.edges[src].append(dest)

    def childrenOf(self,node):
        return self.edges[node]
    def hasNode(self, node):
        return node in self.edges
    def getNode(self,name):
        for n in self.edges:
            if n.name == name:
                return n
        raise NameError(name)
    def __str__(self):
        result = ''
        for src in self.edges:
            for dest in self.edges[src]:
                result=result+src.name +'->'+dest.name+'\n'
        return result[:-1]

class Graph(Digraph):

    def addEdge(self,edge):
        src = edge.src
        dest = edge.dest
        if not (src in self.edges and dest in self.edges):
            raise ValueError('Node not in graph')
        if not dest in self.edges[src]:
            self.edges[src].append(dest)
        if not src in self.edges[dest]:
            self.edges[dest].append(src)

    def __str__(self):
        result = ''
        for src in self.edges:
            for dest in self.edges[src]:
                result=result+src.name +'<->'+dest.name+'\n'
        return result[:-1]

def createGraph():
    Boston = Node('Boston')
    Providence = Node('Providence')
    NewYork = Node('New York')
    Chicago = Node('Chicago')
    Denver = Node('Denver')
    Phoenix = Node('Phoenix')
    LA = Node('Los Angeles')
    myGraph = Digraph()
    myGraph.addNode(Boston)
    myGraph.addNode(Providence)
    myGraph.addNode(NewYork)
    myGraph.addNode(Chicago)
    myGraph.addNode(Denver)
    myGraph.addNode(Phoenix)
    myGraph.addNode(LA)
    myGraph.addEdge(Edge(Providence, Boston))
    myGraph.addEdge(Edge(Boston, Providence))
    myGraph.addEdge(Edge(Boston, NewYork))
    myGraph.addEdge(Edge(Providence, NewYork))
    myGraph.addEdge(Edge(LA, Boston))
    myGraph.addEdge(Edge(NewYork, Chicago))
    myGraph.addEdge(Edge(Chicago, Denver))
    myGraph.addEdge(Edge(Chicago, Phoenix))
    myGraph.addEdge(Edge(Denver, Phoenix))
    myGraph.addEdge(Edge(Denver, NewYork))
    return myGraph
def createGraph1():
    Boston = Node('Boston')
    Providence = Node('Providence')
    NewYork = Node('New York')
    Chicago = Node('Chicago')
    Denver = Node('Denver')
    Phoenix = Node('Phoenix')
    LA = Node('Los Angeles')
    myGraph = Graph()
    myGraph.addNode(Boston)
    myGraph.addNode(Providence)
    myGraph.addNode(NewYork)
    myGraph.addNode(Chicago)
    myGraph.addNode(Denver)
    myGraph.addNode(Phoenix)
    myGraph.addNode(LA)
    myGraph.addEdge(Edge(Boston, Providence))
    myGraph.addEdge(Edge(Providence, Boston))
    myGraph.addEdge(Edge(Boston, NewYork))
    myGraph.addEdge(Edge(Providence, NewYork))
    myGraph.addEdge(Edge(LA, Boston))
    myGraph.addEdge(Edge(NewYork, Chicago))
    myGraph.addEdge(Edge(Chicago, Denver))
    myGraph.addEdge(Edge(Chicago, Phoenix))
    myGraph.addEdge(Edge(Denver, Phoenix))
    myGraph.addEdge(Edge(Denver, NewYork))
    return myGraph
if __name__ == "__main__":
    print('Digraph')
    myGraph = createGraph()
    print(myGraph)
    print('Graph')
    myGraph = createGraph1()
    print(myGraph)

