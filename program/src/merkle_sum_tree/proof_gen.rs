use crate::merkle_sum_tree::{MerkleSumTree, Tree, MerkleProof};
use serde_json::{json, Value};
use std::fs::File;
use std::io::prelude::*;
const N_CURRENCIES: usize = 2;
const N_BYTES: usize = 8;

fn merkle_proof_to_json(proof: &MerkleProof<N_CURRENCIES, N_BYTES>) -> Value {
    json!({
        "entry": {
            "username_as_big_uint": proof.entry.username_as_big_uint().to_string(),
            "balances": proof.entry.balances().iter().map(|b| b.to_string()).collect::<Vec<_>>(),
            "username": proof.entry.username(),
        },
        "root": {
            "hash": format!("{:?}", proof.root.hash),
            "balances": proof.root.balances.iter().map(|&b| format!("{:?}", b)).collect::<Vec<_>>(),
        },
        "sibling_leaf_node_hash_preimage": proof.sibling_leaf_node_hash_preimage.iter().map(|&b| format!("{:?}", b)).collect::<Vec<_>>(),
        "sibling_middle_node_hash_preimages": proof.sibling_middle_node_hash_preimages.iter().map(|preimage| 
            preimage.iter().map(|&b| format!("{:?}", b)).collect::<Vec<_>>()
        ).collect::<Vec<_>>(),
        "path_indices": proof.path_indices.iter().map(|&b| format!("{:?}", b)).collect::<Vec<_>>(),
    })
}

fn main() {
    let merkle_tree = MerkleSumTree::<N_CURRENCIES, N_BYTES>::from_csv("../csv/entry_16.csv").unwrap();
    let proof = merkle_tree.generate_proof(13).unwrap();
    let json = merkle_proof_to_json(&proof);
    let proof_json_str = serde_json::to_string_pretty(&json).unwrap();

    // Create and write to the file
    let mut file = File::create("proof.json").unwrap();
    file.write_all(proof_json_str.as_bytes()).unwrap();
}