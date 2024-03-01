//! A simple script to generate and verify the proof of a given program.

use sp1_core::{SP1Prover, SP1Stdin, SP1Verifier};

const ELF: &[u8] = include_bytes!("../../program/elf/riscv32im-succinct-zkvm-elf");

fn main() {
    let mut stdin = SP1Stdin::new();
    stdin.write(&10);
    // Generate proof.
    let mut proof = SP1Prover::prove(ELF, stdin).expect("proving failed");
    // Read output.
    let is_valid = proof.stdout.read::<bool>();
    println!("valid: {}", is_valid);
    // Verify proof.
    SP1Verifier::verify(ELF, &proof).expect("verification failed");
    // Save proof.
    proof
        .save("proof-with-io.json")
        .expect("saving proof failed");
    println!("succesfully generated proof and verified for the program!");
}
