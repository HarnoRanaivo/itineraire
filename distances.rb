class Point
    attr_accessor :x
    attr_accessor :y
    def initialize(x, y)
        @x = x
        @y = y
    end
end

def distance(p1, p2)
    ((p2.x - p1.x) ** 2 + (p2.y - p1.y) ** 2) ** 0.5
end

# pre : t.size >= 2
def itineraire(t)
    tab = [t[0], t[1]]
    for i in (2...t.size)
        dist = []
        for j in (0...tab.size)
            dist.push(distance(tab[j], t[i]) + distance(tab[(j+1)%tab.size], t[i]))
        end
        tab.insert(dist.index(dist.min)+1, t[i])
    end
    return tab
end

def randompoint(n)
    tab = []
    for i in 0...n
        r = Random.new()
        tab.push(Point.new(r.rand*10, r.rand*10))
    end
    return tab
end
