#include <iostream>
#include <cstdlib>
#include <ctime>
#include <sys/time.h>
#include "game.pb.h"

using namespace std;

class benchmark 
{
public:
  benchmark() {} ;
  ~benchmark() {} ;

  void init() ;

  user make_user(int ratio) ;

  void encode_benchmark(int ratio, int times);
  void decode_benchmark(int ratio, int times);
};
  
void benchmark::init() 
{
  std::srand(std::time(0));
}

long time_diff(struct timeval t1, struct timeval t2) 
{
  return (t2.tv_sec - t1.tv_sec) * 1000000 + (t2.tv_usec - t1.tv_usec) ; 
}

void benchmark::encode_benchmark(int ratio, int times)
{
  user u = make_user(ratio);

  struct timeval t1, t2;
  gettimeofday(&t1, NULL);
  for(int i=0; i < times; i++) 
  {
    string output;
    u.SerializeToString(&output);
  }
  gettimeofday(&t2, NULL);
  cout << "encode ratio: " << ratio << " times: " << times << 
    " cost time: " << time_diff(t1, t2) << endl;
}

void benchmark::decode_benchmark(int ratio, int times) 
{
  user u = make_user(ratio);
  string ubin;
  u.SerializeToString(&ubin);

  struct timeval t1, t2;
  gettimeofday(&t1, NULL);
  
  for(int i=0; i < times; i++)
  {
    user u1;
    u1.ParseFromString(ubin);
  }

  gettimeofday(&t2, NULL);
  cout << "decode ratio: " << ratio << " times: " << times << 
    " cost time: " << time_diff(t1, t2) << endl;
}

user benchmark::make_user(int ratio)
{
  user  u;
  u.set_uid(std::rand());
  u.set_name("woshi_test_xxx");
  u.set_gener(::male);

  
  for (int i = 0; i < ratio; i++)
  {
    int_kv* bags = u.add_bags();
    int_kv* heroes = u.add_heroes();
    int_kv* skills = u.add_skills();
    
    int_kv  kv ;
    kv.set_key( i+1 );
    kv.set_value( 2 * i + 1 );

    bags->CopyFrom(kv);
    heroes->CopyFrom(kv);
    skills->CopyFrom(kv);
  }
  
  return u;
}

int main(int argc, char * argv[]) 
{
  if( argc != 3 ) {
    cout << "Usage: ./a.out Ratio Times\n" << endl;
    return 0 ;
  }

  int ratio = atoi(argv[1]);
  int times = atoi(argv[2]);

  benchmark  bm;
  bm.init();

  bm.encode_benchmark(ratio, times);
  bm.decode_benchmark(ratio, times);

  return 0;
}


