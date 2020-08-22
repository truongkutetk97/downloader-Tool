#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <signal.h>
#include <thread>
#include <iostream>
#include <stdint.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 
#include <sys/un.h>
#include <memory>
#include <string>
#include <vector>
//cURL library
#include <curl/curl.h>
//spdlog library
#include <boost/algorithm/string/erase.hpp>
#include <boost/type_index.hpp>
#include <spdlog/spdlog.h>
#include <spdlog/sinks/basic_file_sinks.h>
#include <spdlog/sinks/stdout_sinks.h>
#include <spdlog/sinks/syslog_sink.h>

#define SERVER_PATH     "/tmp/server.dat"
#define BUFFER_LENGTH    250
#define FALSE              0
#define MAX_PARALLEL 3  
#define NUM_URLS sizeof(urls)/sizeof(char *)
 
using namespace std;

static const char *urls[] = {
  "http://roadtocodingexpert.com",
  "https://www.microsoft.com",
  "https://opensource.org",
  "https://www.google.com",
  "https://www.mozilla.org",
};


void test(string context){

}

static size_t write_cb(char *data, size_t n, size_t l, void *userp)
{
  /* take care of the data here, ignored in this example */ 
  (void)data;
  (void)userp;
  return n*l;
}
 
static void add_transfer(CURLM *cm, int i)
{
  CURL *eh = curl_easy_init();
  curl_easy_setopt(eh, CURLOPT_WRITEFUNCTION, write_cb);
  curl_easy_setopt(eh, CURLOPT_URL, urls[i]);
  curl_easy_setopt(eh, CURLOPT_PRIVATE, urls[i]);
  curl_multi_add_handle(cm, eh);
}
 

class threadObj{
  public: 
    void operator()(int x){
      for (int i =0; i< x; i++){
        cout <<i;
      }
    }
};
int main(int argc, char **argv)
{
  spdlog::info("Welcome to spdlog!");
  spdlog::error("Some error message with arg: {}", 1);

  auto logDownloader = spdlog::stdout_color_mt("downloader");
  auto err_logger = spdlog::stderr_color_mt("stderr");    
  auto file_logger = spdlog::basic_logger_mt("downloader", "logs.txt");
  spdlog::enable_backtrace(32);

  spdlog::get("downloader")->info(
    "Start register logger for downloader {} ", 2311);
  spdlog::get("downloader") ->info("Author: truongdeptrai");



  CURLM *cm;
  CURLMsg *msg;
  unsigned int transfers = 0;
  int msgs_left = -1;
  int still_alive = 1;
 
  curl_global_init(CURL_GLOBAL_ALL);
  cm = curl_multi_init();

/* Limit the amount of simultaneous connections curl should allow: */ 
  curl_multi_setopt(cm, CURLMOPT_MAXCONNECTS, (long)MAX_PARALLEL);
 
  for(transfers = 0; transfers < MAX_PARALLEL; transfers++)
    add_transfer(cm, transfers);
 
  do {
    curl_multi_perform(cm, &still_alive);
 
    while((msg = curl_multi_info_read(cm, &msgs_left))) {
      if(msg->msg == CURLMSG_DONE) {
        char *url;
        CURL *e = msg->easy_handle;
        curl_easy_getinfo(msg->easy_handle, CURLINFO_PRIVATE, &url);
        spdlog::get("downloader") ->info(" ~~R: {}  - {} < {} > ",
                     msg->data.result, curl_easy_strerror(msg->data.result), url);
        curl_multi_remove_handle(cm, e);
        curl_easy_cleanup(e);
      }
      else {
        spdlog::get("downloader") ->info(" ~~E: CURLMsg {}   ",msg->msg);
      }
      if(transfers < NUM_URLS)
        add_transfer(cm, transfers++);
    }
    if(still_alive)
      curl_multi_wait(cm, NULL, 0, 1000, NULL);
 
  } while(still_alive || (transfers < NUM_URLS));
 
  curl_multi_cleanup(cm);
  curl_global_cleanup();
  

  spdlog::get("downloader") ->info(" End");
  return 0;
}
