#include <iostream>

extern "C" {
    double fib(double);
}

int main() {
    std::cout << "fib(40.): " << fib(10.) << std::endl;
}
