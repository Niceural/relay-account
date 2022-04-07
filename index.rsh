"reach 0.1";
"use strict";

export const main = Reach.App(
  {},
  [
    Participant("Alice", { amount: UInt, getRelay: Fun([], Address) }),
    Participant("Relay", { getBob: Fun([], Address) }),
  ],
  (Alice, Relay) => {
    // Alice pays the amount and says who the Relay is
    Alice.only(() => {
      const [amount, relay] = declassify([
        interact.amount,
        interact.getRelay(),
      ]);
    });
    Alice.publish(amount, relay).pay(amount);

    // the consensus remembers who the Relay is
    Relay.set(relay);
    commit();

    // the Relay publishes who Bob is
    Relay.only(() => {
      const bob = declassify(interact.getBob());
    });
    Relay.publish(bob);

    // the consensus pays Bob
    transfer(amount).to(bob);
    commit();

    exit();
  }
);
