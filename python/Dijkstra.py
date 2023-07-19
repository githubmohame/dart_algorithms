u=[[0, 4, 0, 0, 0, 0, 0, 8, 0], 
		[4, 0, 8, 0, 0, 0, 0, 11, 0], 
		[0, 8, 0, 7, 0, 4, 0, 0, 2], 
		[0, 0, 7, 0, 9, 14, 0, 0, 0], 
		[0, 0, 0, 9, 0, 10, 0, 0, 0], 
		[0, 0, 4, 14, 10, 0, 2, 0, 0], 
		[0, 0, 0, 0, 0, 2, 0, 1, 6], 
		[8, 11, 0, 0, 0, 0, 1, 0, 7], 
		[0, 0, 2, 0, 0, 0, 6, 7, 0] 
		]
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
    
select=[0]
dist=[node(cost=-1,end=i,start=i)for i in range(0,9)]
cost=0
location=[-1]*9
index=0
while(True):
    update=[]
    index2=0
    while(index2<9):
        if ((dist[index2])>=((u[index][index2] )+(cost))  or dist[index2]==-1)and u[index][index2]!=0 and dist[index2].end not in select :
            #print(str(index)+"\t"+str(index2))
            update.append(index2)
            dist[index2] =node(end=index2,cost=u[index][index2]+cost,start=index)
            location[index]=dist[index2]
        index2+=1
    dist2=dist.copy()
    dist2.sort()
    for i in dist2:
        if i.end not in select and i.cost!=-1:
            select.append(i.end)
            cost=dist[i.end].cost
            index=i.end
            break
    '''print(dist2)
    print('..........................................................')
    print(dist)
    print(index)'''
    if(len(select)==len(dist)   ):
        break

print(dist)
n=6
path='<-'+str(n)
while(n!=0):
    n=dist[n].start
    path="<-"+str(n)+path
print(path[2:])


print(node(start=0,end=9,cost=12)>=90)