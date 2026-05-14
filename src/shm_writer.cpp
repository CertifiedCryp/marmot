#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <cstring>

void writeToSHM(float canonicMid, float resonanceLock, float pfMuBps, float pfFrac) {
    const char* shmPath = "/dev/shm/granular_signal.bin";
    int fd = open(shmPath, O_RDWR | O_CREAT, 0666);
    ftruncate(fd, 4096);
    
    void* addr = mmap(nullptr, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    
    float data[4] = {canonicMid, resonanceLock, pfMuBps, pfFrac};
    memcpy(addr, data, sizeof(data));
    
    msync(addr, 4096, MS_SYNC);
    munmap(addr, 4096);
    close(fd);
}
