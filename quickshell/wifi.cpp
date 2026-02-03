// 
#include <iostream>
#include <cstdlib>

int main(){
    std::cout << "Scanning wifi \n";
    system("nmcli device wifi list");
    return 0;
}