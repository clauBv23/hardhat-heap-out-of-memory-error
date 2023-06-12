# Sample Hardhat Project

This project only reproduces an issue running a test in Hardhat when the contract size is quite big. The contracts code's only purpose is to increase the contracts' size.

The project can be compiled without problem but, when running the tests it fails.

To reproduce the error follow the next steps:

```shell
npm i   
npx hardhat compile
npx hardhat test
```
Output Error:

```shell

<--- Last few GCs --->
00[350618:0x6479780]    22143 ms: Mark-sweep (reduce) 4097.2 (4104.3) -> 4097.1 (4106.3) MB, 2002.6 / 0.0 ms  (+ 42.0 ms in 16 steps since start of marking, biggest step 17.8 ms, walltime since start of marking 2045 ms) (average mu = 0.162, current mu = 0.0[350618:0x6479780]    23869 ms: Mark-sweep (reduce) 4098.2 (4108.3) -> 4098.2 (4109.3) MB, 1725.1 / 0.0 ms  (+ 0.0 ms in 16 steps since start of marking, biggest step 0.0 ms, walltime since start of marking 1726 ms) (average mu = 0.087, current mu = 0.000

<--- JS stacktrace --->

FATAL ERROR: MarkCompactCollector: young object promotion failed Allocation failed - JavaScript heap out of memory
 1: 0xa38a30 node::Abort() [node]
 2: 0x96e0af node::FatalError(char const*, char const*) [node]
 3: 0xbb7ebe v8::Utils::ReportOOMFailure(v8::internal::Isolate*, char const*, bool) [node]
 4: 0xbb8237 v8::internal::V8::FatalProcessOutOfMemory(v8::internal::Isolate*, char const*, bool) [node]
 5: 0xd74445  [node]
 6: 0xda4dde v8::internal::EvacuateNewSpaceVisitor::Visit(v8::internal::HeapObject, int) [node]
 7: 0xdb0e16 v8::internal::FullEvacuator::RawEvacuatePage(v8::internal::MemoryChunk*, long*) [node]
 8: 0xd9cfaf v8::internal::Evacuator::EvacuatePage(v8::internal::MemoryChunk*) [node]
 9: 0xd9d228 v8::internal::PageEvacuationTask::RunInParallel(v8::internal::ItemParallelJob::Task::Runner) [node]
10: 0xd8fb09 v8::internal::ItemParallelJob::Run() [node]
11: 0xdb2d70 void v8::internal::MarkCompactCollectorBase::CreateAndExecuteEvacuationTasks<v8::internal::FullEvacuator, v8::internal::MarkCompactCollector>(v8::internal::MarkCompactCollector*, v8::internal::ItemParallelJob*, v8::internal::MigrationObserver*, long) [node]
12: 0xdb360c v8::internal::MarkCompactCollector::EvacuatePagesInParallel() [node]
13: 0xdb37d5 v8::internal::MarkCompactCollector::Evacuate() [node]
14: 0xdc57d1 v8::internal::MarkCompactCollector::CollectGarbage() [node]
15: 0xd81a98 v8::internal::Heap::MarkCompact() [node]
16: 0xd83588 v8::internal::Heap::CollectGarbage(v8::internal::AllocationSpace, v8::internal::GarbageCollectionReason, v8::GCCallbackFlags) [node]
17: 0xd869cc v8::internal::Heap::AllocateRawWithRetryOrFailSlowPath(int, v8::internal::AllocationType, v8::internal::AllocationOrigin, v8::internal::AllocationAlignment) [node]
18: 0xd550ab v8::internal::Factory::NewFillerObject(int, bool, v8::internal::AllocationType, v8::internal::AllocationOrigin) [node]
19: 0x109d68f v8::internal::Runtime_AllocateInYoungGeneration(int, unsigned long*, v8::internal::Isolate*) [node]
20: 0x14467f9  [node]
```

To check contracts size run:
`npx hardhat size-contracts`

By doing that some contracts will exceed the size limit and in particular `ReallyHugeContract` is quite big.
```shell
·----------------------|--------------|----------------·
 |  Contract Name       ·  Size (KiB)  ·  Change (KiB)  │
 ·······················|··············|·················
 |  ReallyHugeContract  ·     224.501  ·                │
 ·----------------------|--------------|----------------·
```

Removing the `ReallyHugeContract` contract definition will solve the heap out-of-memory error when running the tests.


I tried running `hh --max-memory 4096 test` and didn't fix it. 


## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
<!-- [![All Contributors](https://img.shields.io/github/all-contributors/clauBv23/hardhat-heap-out-of-memory?color=ee8449&style=flat-square)](#contributors) -->
