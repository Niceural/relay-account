# Relay Account

This decentralized application consists in a third-party account, which an account called Alice can transfer funds to. The funds will be secured by a secret. A second wallet called Bob can then transfer the funds to any wallet after having provided the correct secret. For this application to be safely deployable to the mainnet, the secret provided by Bob should be protected against malicious miners. [Reach](https://docs.reach.sh/#reach-top) programming language for decentralized applications is used to implement this project.

# Table of Contents

- [Relay Account](#relay-account)
- [Table of Contents](#table-of-contents)
- [Backend](#backend)
  - [Problem Analysis](#problem-analysis)
  - [Data Definition](#data-definition)
  - [Communication Construction](#communication-construction)
- [Assertion Insertion](#assertion-insertion)

# Backend

## Problem Analysis

The aims and objectives of this application are stated below:

1. allow Alice to lock her funds into a third-party wallet which anyone can know the balance of;
2. be safe against corrupted miners;
3. allow Bob to transfer the funds to any account address.

We previously implemented a simpler version of this project, called [Hash Lock](https://github.com/Niceural/hash-lock). It however was not protected against malicious miners. In this project, we propose a more robust solution where Alice will represent her secret as an account authorized to transfer the funds.

This application involves two principals: a payer called Alice and a receiver called Bob.
The participants of this application are Alice (the payer) and the Relay.

## Data Definition

The data will be stored using the following data types:

- `UInt` for the amount transferred;
- `Address` for the account address chosen by Bob;
- `Address` for the Relay account address.

## Communication Construction

The communication pattern is described below:

1. Alice transfers the amount and says who the relay is;
2. the consensus remembers what the Relay address is;
3. the Relay publishes Bob's address;
4. the consensus pays Bob.

# Assertion Insertion
