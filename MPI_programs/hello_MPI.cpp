#include <iostream>
#include <mpi.h>

// This code has bugs!
// Can you guess what the author wanted?
// Can you "fix" the code?
// It helps to understand how MPI works. 

int main(int argc, char** argv) {
    // Initialize the MPI environment
    MPI_Init(&argc, &argv);

    // Get the number of processes
    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    // Get the rank of the current process
    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);

    // Get the name of the processor
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;
    MPI_Get_processor_name(processor_name, &name_len);

    // Loop to print "Hello World" from each process
    for (int i = 0; i < 3; ++i) { // Example: loop 3 times
        std::cout << "Hello World from process " << world_rank << " of "
                  << world_size << " on processor " << processor_name
                  << " (from loop " <<  i << ")" << std::endl;
    }

    // Finalize the MPI environment
    MPI_Finalize();

    return 0;
}

