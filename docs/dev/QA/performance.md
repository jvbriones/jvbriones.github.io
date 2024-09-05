---
sidebar_position: 50
---

# Performance tests

The performance tests should be scheduled and executed with the most critical scenarios due the costly environment resources, normally done in pre-prod env but if possible, in Prod.

## Design of new tests

These are non-functional tests, therefore we should not check **what** the services are providing since for that we have the functional tests. Instead, we have to check **how good** both the software + the infrastructure provide the service.

The testing environment should be as much similar to prod as possible, scale compatible, caches, and isolated for the tests to avoid noise.

We need to identify the testing scenario, since there is a difference between user experience based scenarios and benchmarking of sevices. For example, is not the same to simulate a user purchase (which will perform different searches previously, and will have a `think` time) than to know how many purchases simultaneously can handle the SUT (system under test). To stablish a proper pattern for the request arrivals of the user scenarios, it's necessary to know the poisson distribution lambda - see this video [www.youtube.com/watch?v=X4NVS1kDoMQ]

For designing the workload and the scenario, take into the account the number of users vs the requests per user. Each Thread of a ThreadGroup defines a user's session, i.e. the user's actions. You can record from the browser or postman the user actions and then clean up what is needed to prepare all the http requests. As well, try to reduce the asserts as much as possible.

The single systems components like a micro-service API can as well be tested, to check response times or reliability ir regards e.g. DBs.

### Performance is measured by

- **Response time** (request time + process time + response time). The **less** the better.
- **Throughput** (number of transactions, i.e, requests and responses or kbytes/seconds). The **more** the better.
- **Reliability** (number of errors/number of requests). The **less** the better.
- **Scalability** (how the other factors are improved when scaling the system under test)

- **User satisfaction (APDEX index)**
Apdex numerically scores the level of satisfaction of an end user based on application responsiveness by calculating the degree to which user expectations compare to performance in a fractional 0 (no users satisfied) to 1 (all users satisfied) scale.

Note that JMeter cannot execute javascript code since is not a browser. That's why we can better use tools like [www.webpagetest.org] to have an overview of what a real e2e user request time implies, where the backend could be the 25% and the front the 75% (size of the content matters). In such cases, the front is what needs to be optimized. A very good video about it [www.youtube.com/watch?v=nOZYQto7Vcg]

### Workload estimation

For example, if there are 5 millions of users of the SUT, we need to know how many users we need to replicate in our tests to have a proper population and estimation to have a confidence of 99% of the results, which gives us a workload in our test of about 16k users (more or less explained). See this video for more info [www.youtube.com/watch?v=X4NVS1kDoMQ]

There are tools like [www.raosoft.com/samplesize.html] that help us to compute those values.

### Kind of tests

We will mention here what the tests do:

#### RampUp

To find the maximum number of simultaneuos users making requests where the SUT start performing badly.

For that, the test add more and more parallel users progressively. To detect the moment from where the SUT reaches his peak, we need to correlate the load with the responses. Normaly the response time increases along the load progressively but it will be a moment from where it starts being exponential, which means that there is a resource that cannot handle it anymore. To identify where is the bottleneck, we might need to repeat the test but in lower levels (e.g. APIs).

#### Uniform load test

To check whether the SUT can properly handle the e.g. 80% of its max peak during a time of period. If the time period is long, we can detect memory or connection leaks.

#### Load with Spikes

To check the system steadiness with a constant load over time but with brief periods of sudden increments of the load (peaks e.g. of max capacity).

## Custom tools for performance tests

### New users generator

In order to avoid the SSO integration and the registration and creation of new users, you can use a custom tool e.g. to inserts directly in the databases new users with valid data.

### JWT token generator

In order to avoid the SSO integration and the login of new users, you can use a tool that generate valid JWT tokens in advance to be used during the test. In this way, we can generate tokens to simulate fake logins.

## Run the tests

Run the tests always via console, and disable the unnecessary elements like the graphic generators, e.g, the view tree listener which is just for debugging.

### Traffic injectors

Use case:

1. Start the virtual machine (e.g. injector-1) and access to it
2. Ensure your SUT allows the incoming IP of the injector machine
3. enter via ssh to the machine e.g. `ssh -i injector-1.private user@53.134.40.2`
4. git checkout or scp of the test files to the machine in a folder dedicated for test session
5. run the tests

## SUT Monitoring

It is utterly important to monitor the **whole** SUT during the tests to identify the bottlenecks, e.g. insufficient infrastructure provisioning, defects on the software or configuration, components faults like DBs, etc.

Note that the monitoring tools like the JMeter pluging `perfMon` consume some overhead that need to be taken into the account (in that case is about 3-4% of the SUT). Depending on the test, it can be better to even disable.

By using e.g. Azure Insights we can detect how the system perform.

## Test case Monitoring

There is a JMeter listener called `Backend listener` that we can use to send the test metrics to an InfluxDB where a Grafite server can read and present the results in live dashboards.
