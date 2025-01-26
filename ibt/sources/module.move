module 0x855bce43e60bf4f6f5a06c590d964519bd8b54e2180cdc6d8be3b45007a62fa9::ibt {
    use sui::coin::{self, TreasuryCap};
    use sui::tx_context;
    use sui::object;
    use sui::transfer;

    // IBT struct with key and drop abilities
    public struct IBT has key, store, drop {
        id: object::UID,
        treasury_cap: TreasuryCap<IBT>,
    }

    // Mint function
    public fun mint(
        admin: &mut IBT,
        amount: u64,
        ctx: &mut tx_context::TxContext
    ): coin::Coin<IBT> {
        coin::mint(&mut admin.treasury_cap, amount, ctx)
    }

    // Burn function
    public fun burn(
        admin: &mut IBT,
        coin: coin::Coin<IBT>
    ) {
        coin::burn(&mut admin.treasury_cap, coin)
    }

    // Deploy function
    public entry fun deploy(ctx: &mut tx_context::TxContext): IBT {
        let id = object::new(ctx);
        let treasury_cap = coin::TreasuryCap::new();
        let ibt = IBT { id, treasury_cap };
        transfer::freeze_object(ibt)
    }
}

