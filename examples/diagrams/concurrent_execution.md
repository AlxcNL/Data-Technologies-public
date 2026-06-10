# Concurrent Execution

## Multi-threading

<p>
Two threads run the same program concurrently, each loading and updating a variable in the Shared Memory.
</p>

<ul>

**Program Statements**

```c
temp = read (total);
temp += 1;
store(temp, total);
```

<b>Shared Variables</b>

```c
total = 12
```

## Race Condition

A Race Condition occurs when multiple processes / threads have concurrent access to a shared resource and <strong>at least one</strong> of them overwrites the value of the shared resource (Readers - Writers Problem).

**Different execution Scenarios result in a different value of total**

<ol>

<li>Sync error: Contribution of P is overwritten</li>

```mermaid
flowchart LR
style P1 fill:#ff0000
style P2 fill:#ff0000
style P3 fill:#ff0000
style Q1 fill:#0000ff
style Q2 fill:#0000ff
style Q3 fill:#0000ff

P1 --> P2 --> Q1 --> Q2 --> P3 --> Q3
```

P statement | P temp | Q statement | Q temp | total 
---|---|---|---|--- 
P1: read(12) | 12 | | | 12
P2: temp=12+1 | 13 | | | 12
| | | Q1: read(12) | 12 | 12
| | | Q2: temp=12+1 | 13 | 12
P3: store(13, total) | 13 | | | 13
| | | Q3: store(13, total) | 13 | 13

</li>

<li>Sync error: Contribution of Q is overwritten</li>

```mermaid
flowchart LR
style P1 fill:#ff0000
style P2 fill:#ff0000
style P3 fill:#ff0000
style Q1 fill:#0000ff
style Q2 fill:#0000ff
style Q3 fill:#0000ff

P1 --> P2 --> Q1 --> Q2 --> Q3 --> P3
```
P statement | P temp | Q statement | Q temp | total 
---|---|---|---|--- 
P1: read(12) | 12 | | | 12
P2: temp=12+1 | 13 | | | 12
| | | Q1: read(12) | 12 | 12
| | | Q2: temp=12+1 | 13 | 12
| | | Q3: store(13, total) | 13 | 13
P3: store(13, total) | 13 | | | 13

</li>

<li>Synchronised execution: Q uses updated version of total</li>

```mermaid
flowchart LR
style P1 fill:#ff0000
style P2 fill:#ff0000
style P3 fill:#ff0000
style Q1 fill:#0000ff
style Q2 fill:#0000ff
style Q3 fill:#0000ff

P1 --> P2 --> P3 --> Q1 --> Q2 --> Q3
```

P statement | P temp | Q statement | Q temp | total 
---|---|---|---|--- 
P1: read(12) | 12 | | | 12
P2: temp=12+1 | 13 | | | 12
P3: store(13, total) | 13 | | | 13
| | | Q1: read(13) | 13 | 13
| | | Q2: temp=13+1 | 14 | 13
| | | Q3: store(14, total) | 14 | 14

<li>Synchronised execution: P uses updated version of total</li>

```mermaid
flowchart LR
style P1 fill:#ff0000
style P2 fill:#ff0000
style P3 fill:#ff0000
style Q1 fill:#0000ff
style Q2 fill:#0000ff
style Q3 fill:#0000ff

Q1 --> Q2 --> Q3 --> P1 --> P2 --> P3
```

P statement | P temp | Q statement | Q temp | total 
---|---|---|---|--- 
| | | Q1: read(12) | 12 | 12
| | | Q2: temp=12+1 | 13 | 12
| | | Q3: store(13, total) | 13 | 13
P1: read(13) | 13 | | | 13
P2: temp=13+1 | 14 | | | 13
P3: store(14, total) | 14 | | | 14

</li>

</ol>

## Critical Section Problem

The Critical Section is the piece of code which can cause a Race Condition on a shared variable. The code that sequentially follows the Critical Section is called the Remainder Section. 

**Critical Section**

```c
temp = 0;
// Entry of critical section
temp = read (total);
temp += 1;
store(temp, total);
// Remainder section
print("Total : %s", $temp);
```

A solution to the Critical Section Problem must satisfy:
<ol>

<li>
Mutual Exclusion<br>
If a thread is executing the code in its Critical Section, then no other threads are allowed to enter their Critical Section. 
</li>
<li>
Progress<br>
If no thread is executing code in its Critical Section and other threads want to enter their Critical Sections, then only those threads that are not in their Remainder Section (and thus already leaved the Critical Section) may participate in determining whose turn it is to enter its Critical Section. 
</li>
<li>Bounded Waiting</li>
After a thread has made a request to enter its Critical Section, only a limited number of times the Critical Section can be entered by other threads.
</ol>

### Mutual Exclusion

To avoid race conditions, access to a shared resource must be mutual exclusive. This can be implemented by restricting the execution of the critical to one thread at a time. The rules for entering a leaving the Critical Section are defined by the pre- and post-protocol respectively. 

```c
// Preprotocol for mutual exclusion
// Entry of critical section

// Critical Section

// Postprotocol
// Remainder section
```

### Starvation
The aim of requirements Progress and Bounded Waiting is to prevent a situation in which one or more threads always have to wait.<br>

**Liveness Property** 
<br>If a thread makes a request, it should <strong>eventually</strong> enter its critical section.

**Safety Property**
<br>There must <strong>always</strong> be a thread for which the critical section is accessible.