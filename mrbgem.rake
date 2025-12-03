MRuby::Gem::Specification.new("mruby-secp256k1") do |spec|
  spec.license = "Unlicensed"
  spec.author  = "Nervos Core Dev <dev@nervos.org>"
  spec.summary = "secp256k1(with Nervos' patches) binding for mruby"

  #spec.cc.flags += [`pkg-config --static --cflags libsecp256k1`.strip]
  #spec.linker.flags += [`pkg-config --static --libs libsecp256k1`.strip]
  spec.linker.libraries << 'secp256k1'
end
