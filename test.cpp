// #include <cstddef>
// #include <iostream>
// #include <libnm/NetworkManager.h>
// #include <glib.h>
#include <QNetworkInterface>


// using namespace std;

int main() {
    // cout << "Hello World";
    NMClient *client;
    client = nm_client_new(NULL, NULL);
    if(client)
        g_print("NetworkManager %s", nm_client_get_version(client));
    return 0;
}