#include <iostream>
#include <cstdlib>

int * return_stack_ptr(int val) {
    int i = val;
    std::cout << &i << std::endl;
    return &i;
}

int &return_stack_ref(int val) {
    int i = val;
    return i;
}

int *return_heap_ptr(int val) {
    auto ptr = new int(val);
    return ptr;
}

int main (int argc, char *argv[]) {
    int *int_heap = return_heap_ptr(9);
    std::cout << *int_heap << std::endl;

    int *int_ptr = return_stack_ptr(10);
    std::cout << int_ptr << std::endl;
    std::cout << &return_stack_ref(11) << std::endl;
    
    return EXIT_SUCCESS;
}