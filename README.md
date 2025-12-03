# mruby-secp256k1 (Mirror)

This repository is a **mirror** created solely to preserve and keep buildable a high-quality mruby binding for libsecp256k1 that was originally developed and used internally by the Nervos Network Core Dev team.

### Important Notice

- **I (mattn) am NOT the author of this gem**
- I do **not** claim any copyright or ownership
- The original implementation was written by engineers of the Nervos Network Core Dev project

https://github.com/nervosnetwork/mruby-contracts

### Installation

Add the following line to your `build_config.rb` or `mrbgem.rake`:

```ruby
conf.gem github: 'mattn/mruby-secp256k1'
```

or (mgem):

```ruby
conf.gem mgem: 'mruby-secp256k1'
```

### Usage Example (Schnorr signature for nostr)

```ruby
require 'secp256k1'

privkey_hex = "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
data_hex    = "e8c9f8e8f9e0c1d2e3f4a5b6c7d8e9f0a1b2c3d4e5f67890123456789abcdef"

priv = [privkey_hex].pack("H*")
msg  = [data_hex].pack("H*")
aux  = "\x00" * 32  # auxiliary random data (can be anything)

sig = Secp256k1.schnorr_sign(msg, priv, aux)
puts sig.unpack1("H*")  # 64-byte Schnorr signature (BIP-340)
```

### Verification

```ruby
pubkey = Secp256k1::PrivateKey.new(privkey: priv).pubkey_compressed
valid = Secp256k1.schnorr_verify(msg, sig, pubkey)
puts valid  # => true
```

### License

Same as the original libsecp256k1: MIT License
The binding code itself follows the license of the original Nervos repository (MIT).

Thank you to the original Nervos Network Core team for creating this excellent binding.
