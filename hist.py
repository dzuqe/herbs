import os
import matplotlib.pyplot as plt

# get iterations
iters = [int(line[:-1]) for line in open('out', 'r')]

# count
counts = [0] * 1001
for iter in iters:
    counts[int(iter)] += 1

# get indices and counts of numbers > 0
count_dict = {}
i = 1
for count in counts:
    if count > 0:
        count_dict[str(i)] = count
    i += 1
            

plt.bar(list(count_dict.keys()), count_dict.values(), color='g')
plt.show()

