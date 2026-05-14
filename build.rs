fn main() {
    capnpc::CompilerCommand::new()
        .file("granular_gate.capnp")
        .run()
        .expect("schema compiler command failed");
}
