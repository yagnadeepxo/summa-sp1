#![no_main]
use sp1_zkvm::io;
use summa_sp1::merkle_sum_tree::{MerkleSumTree, Tree};
sp1_zkvm::entrypoint!(main);

const N_CURRENCIES: usize = 2;
const N_BYTES: usize = 8;

pub fn main() {
    let n = sp1_zkvm::io::read::<usize>();
    let merkle_tree = MerkleSumTree::<N_CURRENCIES, N_BYTES>::from_csv("../csv/entry_16.csv").unwrap();
    // get proof for entry 0
    let proof = merkle_tree.generate_proof(n).unwrap();
    // verify proof
    let is_valid = merkle_tree.verify_proof(&proof);
    io::write(&is_valid);
}

/* 
 we need to refactor the entire codebase to be compatible with SP1, this is a naive demo
*/

// fn verify_proof(proof: &MerkleProof< N_CURRENCIES , N_BYTES>) -> bool {
//     let mut node = proof.entry.compute_leaf();

//     let sibling_leaf_node =
//         Node::<N_CURRENCIES>::leaf_node_from_preimage(&proof.sibling_leaf_node_hash_preimage);

//     let mut hash_preimage = [Fp::zero(); N_CURRENCIES + 2];
//     for (i, balance) in hash_preimage.iter_mut().enumerate().take(N_CURRENCIES) {
//         *balance = node.balances[i] + sibling_leaf_node.balances[i];
//     }

//     if proof.path_indices[0] == 0.into() {
//         hash_preimage[N_CURRENCIES] = node.hash;
//         hash_preimage[N_CURRENCIES + 1] = sibling_leaf_node.hash;
//         node = Node::middle_node_from_preimage((&hash_preimage));
//     } else {
//         hash_preimage[N_CURRENCIES] = sibling_leaf_node.hash;
//         hash_preimage[N_CURRENCIES + 1] = node.hash;
//         node = Node::middle_node_from_preimage((&hash_preimage));
//     }

//     for i in 1..proof.path_indices.len() {
//         let sibling_node = Node::<N_CURRENCIES>::middle_node_from_preimage(
//             &proof.sibling_middle_node_hash_preimages[i - 1],
//         );

//         let mut hash_preimage = [Fp::zero(); N_CURRENCIES + 2];
//         for (i, balance) in hash_preimage.iter_mut().enumerate().take(N_CURRENCIES) {
//             *balance = node.balances[i] + sibling_node.balances[i];
//         }

//         if proof.path_indices[i] == 0.into() {
//             hash_preimage[N_CURRENCIES] = node.hash;
//             hash_preimage[N_CURRENCIES + 1] = sibling_node.hash;
//             node = Node::middle_node_from_preimage((&hash_preimage));
//         } else {
//             hash_preimage[N_CURRENCIES] = sibling_node.hash;
//             hash_preimage[N_CURRENCIES + 1] = node.hash;
//             node = Node::middle_node_from_preimage((&hash_preimage));
//         }
//     }
//     proof.root.hash == node.hash && proof.root.balances == node.balances

// }
