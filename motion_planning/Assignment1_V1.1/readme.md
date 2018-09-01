
A-star Algorithm on a grid

The skeleton code below contains some of the code needed to implement the A Star algorithm on a grid based environment. 
Your job is to complete the function by finishing the marked section of the file. The code is designed to maintain the following 2D arrays:
            • g: This array encodes the current estimate for the distance between each node and the start node 
            • f:  This array encodes the sum of the g value for each node and the value of the Heuristic function, H. The code that we have provided already computes an array, H, with appropriate heuristic function values for each node.

The map and the parent arrays carry out the same function as in DijkstraGrid 
On every iteration through the main loop the code finds the unvisited cell with the smallest f value. 
The part of this function that you need to write should consider the four neighbors of the cell to the north, south east and west and for each neighbor it should decide if it needs to update the corresponding entries in the f, g, map and parent arrays.
If you know how to use sub functions in Matlab you may find it useful to create one that you can then apply repeatedly to each of the neighboring cells, but this is not required.
Once completed, run the script and pass the subsequent testcases.
