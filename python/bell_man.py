u=[[0, -1, 4, 0, 0], [0, 0, 3, 2, 2], [0, 0, 0, 0, 0], [0, 1, 5, 0, 0], [0, 0, 0, -3, 0]]

class node():
    end=0 
    cost=0
    start=0
    def __repr__(self):
        return str(self.start)+"->"+str(self.end) +"  "+str(self.cost)
    def __init__(self,end,cost,start) -> None:
        self.end=end
        self.cost=cost
        self.start=start
    def __lt__(self, other):
        if(type(other)==type(90)):
            return self.cost<other
        return self.cost<other.cost
    def __gt__ (self, other):
        if(type(other)==type(90)):
            return self.cost>other
        return self.cost>other.cost
    def __le__(self, other):
        if(type(other)==type(90)):
            return self.cost<=other
        return self.cost<=other.cost
    def __ge__  (self, other):
        if(type(other)==type(90)):
            return self.cost>=other
        return self.cost>=other.cost
    def __eq__(self, other: object) -> bool:
        if(type(other)==type(90)):
            return self.cost==other
        return self.cost==other.cost
cost=0
dist=[node(end=-1,start=0,cost=0) for i in range(0,5)]
for i in range(0,len(u)-1):
    flage=False
    for j in  range(0,len(u)):
        for m in range(0,len(u)):
            if  (dist[m].end==-1 or(dist[m])>=((u[j][m] )+cost) )and u[j][m]!=0:
                cost=dist[j].cost
                flage=True
                dist[m]=node(end=m,cost=(u[j][m] )+cost,start=j)
    print('uuiytty')
    if(flage==False):
        break
print(dist)



'''
class Graph:
 
    def __init__(self, vertices):
        self.V = vertices  # No. of vertices
        self.graph = []
 
    # function to add an edge to graph
    def addEdge(self, u, v, w):
        self.graph.append([u, v, w])
 
    # utility function used to print the solution
    def printArr(self, dist):
        print("Vertex Distance from Source")
        for i in range(self.V):
            print("{0}\t\t{1}".format(i, dist[i]))
 
    # The main function that finds shortest distances from src to
    # all other vertices using Bellman-Ford algorithm. The function
    # also detects negative weight cycle
    def BellmanFord(self, src):
 
        # Step 1: Initialize distances from src to all other vertices
        # as INFINITE
        dist = [float("Inf")] * self.V
        dist[src] = 0
 
        # Step 2: Relax all edges |V| - 1 times. A simple shortest
        # path from src to any other vertex can have at-most |V| - 1
        # edges
        for _ in range(self.V - 1):
            # Update dist value and parent index of the adjacent vertices of
            # the picked vertex. Consider only those vertices which are still in
            # queue
            for u, v, w in self.graph:
                if dist[u] != float("Inf") and dist[u] + w < dist[v]:
                    dist[v] = dist[u] + w
 
        # Step 3: check for negative-weight cycles. The above step
        # guarantees shortest distances if graph doesn't contain
        # negative weight cycle. If we get a shorter path, then there
        # is a cycle.
 
        for u, v, w in self.graph:
            if dist[u] != float("Inf") and dist[u] + w < dist[v]:
                print("Graph contains negative weight cycle")
                return
 
        # print all distance
        self.printArr(dist)
 
 
# Driver's code
if __name__ == '__main__':
    g = Graph(5)
    g.addEdge(0, 1, -1)
    g.addEdge(0, 2, 4)
    g.addEdge(1, 2, 3)
    g.addEdge(1, 3, 2)
    g.addEdge(1, 4, 2)
    g.addEdge(3, 2, 5)
    g.addEdge(3, 1, 1)
    g.addEdge(4, 3, -3)
l3=[[0]*5 for i in range(5)]
for i in g.graph:
    l3[i[0]][i[1]]=i[2]
    
print(l3)'''