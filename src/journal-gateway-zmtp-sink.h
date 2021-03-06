/* general options, fit them to your needs */
#define ENV_REMOTE_JOURNAL_DIRECTORY "JOURNAL_REMOTE_DIR"

#define DEFAULT_LOG_EXPOSED_SOCKET "tcp://*:5555"
#define ENV_LOG_EXPOSED_SOCKET "GATEWAY_LOG_PEER"

#define DEFAULT_CTRL_EXPOSED_SOCKET "tcp://*:27001"
#define ENV_CTRL_EXPOSED_SOCKET "GATEWAY_CONTROL_PEER"

#define UNUSED(x) (void)(x)

#define POLL_WAIT_TIME 100

// zmq_poll timeout changed in v3 from micro- to milli-seconds
#define ZMQ_VERSION_FACTOR 1000
